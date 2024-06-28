import "dart:async";
import "package:http/http.dart" as http;
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:loco11y/areas/http_log/proxy/http_log_persister.dart";
import "package:shelf/shelf.dart";
import "package:shelf/shelf_io.dart" as shelf_io;

/// Runs a HTTP based proxy server that consumes requests, forwards them to the intended destination and
/// both logs and returns the response.
Future<void> runProxyServer(ProviderContainer container) async {
  final requestHandlerPipeline =
      const Pipeline().addHandler(_proxyHandler(container));

  await shelf_io.serve(requestHandlerPipeline, "127.0.0.1", 9083);
}

Future<Response> Function(Request) _proxyHandler(ProviderContainer container) {
  return (req) async {
    final (proxiedRequest, proxiedResponse) = await _makeProxyRequest(req);

    container.read(httpLogPersisterProvider.notifier).addLog(
          HttpLog(
            method: req.method,
            uri: proxiedRequest.url,
            request: HttpLogRequest(headers: req.headers),
            response: HttpLogResponse(
              statusCode: proxiedResponse.statusCode,
              headers: proxiedResponse.headers,
            ),
          ),
        );

    return Response(
      proxiedResponse.statusCode,
      body: Stream.value(List<int>.from(proxiedResponse.bodyBytes)),
      headers: proxiedResponse.headers,
    );
  };
}

Future<(http.Request, http.Response)> _makeProxyRequest(
  Request request,
) async {
  final client = http.Client();
  final newUri = Uri.parse(Uri.decodeComponent(request.url.toString()));

  final proxiedRequest = http.Request(request.method, newUri);
  for (var header in request.headers.entries) {
    proxiedRequest.headers[header.key] = header.value;
  }
  proxiedRequest.headers["host"] = newUri.host;

  final proxiedResponse = await client.send(proxiedRequest);
  proxiedResponse.headers.remove("content-encoding");
  proxiedResponse.headers.remove("transfer-encoding");

  return (proxiedRequest, await http.Response.fromStream(proxiedResponse));
}
