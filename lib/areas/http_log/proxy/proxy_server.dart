import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:loco11y/areas/http_log/proxy/http_log_persister.dart";
import "package:shelf/shelf.dart";
import "package:shelf/shelf_io.dart" as shelf_io;

Future<void> runProxyServer(ProviderContainer container) async {
  final requestHandlerPipeline =
      const Pipeline().addHandler(_proxyHandler(container));

  await shelf_io.serve(requestHandlerPipeline, "127.0.0.1", 9083);
}

Response Function(Request) _proxyHandler(ProviderContainer container) {
  return (req) {
    container.read(httpLogPersisterProvider.notifier).addLog(
          HttpLog(
            method: "GET",
            uri: Uri.parse("https://www.google.com"),
            request: HttpLogRequest(),
            response: HttpLogResponse(statusCode: 500),
          ),
        );

    return Response.ok("wahoo");
  };
}
