import "dart:typed_data";

import "package:loco11y/areas/http_log/utils/content_type_helpers.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
part "http_log_persister.g.dart";

@riverpod
class HttpLogPersister extends _$HttpLogPersister {
  @override
  Future<List<HttpLog>> build() async {
    return [
      HttpLog(
        method: "POST",
        uri: Uri.parse("https://api.github.com/api/v1/users"),
        request: HttpLogRequest(headers: {}),
        response: HttpLogResponse(
          statusCode: 200,
          headers: {},
          body: Uint8List(0),
        ),
      ),
      HttpLog(
        method: "POST",
        uri: Uri.parse("https://api.github.com/api/v1/stars"),
        request: HttpLogRequest(headers: {}),
        response: HttpLogResponse(
          statusCode: 200,
          headers: {},
          body: Uint8List(0),
        ),
      ),
      HttpLog(
        method: "POST",
        uri: Uri.parse("https://api.github.com/api/v1/repositories"),
        request: HttpLogRequest(headers: {}),
        response: HttpLogResponse(
          statusCode: 200,
          headers: {},
          body: Uint8List(0),
        ),
      ),
    ];
  }

  void addLog(HttpLog log) async {
    final data = await future;
    state = AsyncValue.data([log, ...data]);
  }
}

class HttpLog {
  final String method;
  final Uri uri;
  final DateTime receivedAt;
  final HttpLogRequest request;
  final HttpLogResponse response;

  HttpLog({
    required this.method,
    required this.uri,
    required this.request,
    required this.response,
    DateTime? receivedAt,
  }) : receivedAt = receivedAt ?? DateTime.now();
}

class HttpLogRequest {
  final Map<String, String> headers;

  HttpLogRequest({required this.headers});

  String get contentType =>
      contentTypeWithoutCharset(headers["content-type"] ?? "text/plain");
}

class HttpLogResponse {
  final int statusCode;
  final Map<String, String> headers;
  final Uint8List body;

  HttpLogResponse({
    required this.statusCode,
    required this.headers,
    required this.body,
  });

  String get contentType =>
      contentTypeWithoutCharset(headers["content-type"] ?? "text/plain");
}
