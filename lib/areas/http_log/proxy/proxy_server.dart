import "dart:async";
import "dart:io";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:loco11y/areas/http_log/proxy/http_log_persister.dart";
import "package:shelf/shelf.dart";
import "package:shelf/shelf_io.dart" as shelf_io;

Future<void> runProxyServer(ProviderContainer container) async {
  final requestHandlerPipeline =
      const Pipeline().addHandler(_proxyHandler(container));

  await shelf_io.serve(requestHandlerPipeline, "127.0.0.1", 9083);
}

Future<Response> Function(Request) _proxyHandler(ProviderContainer container) {
  final client = HttpClient();

  return (req) async {
    final newUri = Uri.parse(Uri.decodeComponent(req.url.toString()));

    final proxiedRequest = await client.openUrl(req.method, newUri);
    for (var header in req.headers.entries) {
      proxiedRequest.headers.set(header.key, header.value);
    }
    proxiedRequest.headers.set("host", newUri.host);

    final proxiedResponse = await proxiedRequest.close();

    final responseHeaders = <String, String>{};

    proxiedResponse.headers.forEach((name, values) {
      responseHeaders[name] = values.join(", ");
    });
    responseHeaders.remove("content-encoding");
    responseHeaders.remove("transfer-encoding");

    container.read(httpLogPersisterProvider.notifier).addLog(
          HttpLog(
            method: proxiedRequest.method,
            uri: newUri,
            request: HttpLogRequest(headers: req.headers),
            response: HttpLogResponse(statusCode: proxiedResponse.statusCode),
          ),
        );

    return Response(
      proxiedResponse.statusCode,
      body: proxiedResponse,
      headers: responseHeaders,
    );
  };
}
