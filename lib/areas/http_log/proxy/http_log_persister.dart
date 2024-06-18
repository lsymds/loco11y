import "dart:io";

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
        request: HttpLogRequest(),
        response: HttpLogResponse(statusCode: 200),
      ),
      HttpLog(
        method: "POST",
        uri: Uri.parse("https://api.github.com/api/v1/stars"),
        request: HttpLogRequest(),
        response: HttpLogResponse(statusCode: 200),
      ),
      HttpLog(
        method: "POST",
        uri: Uri.parse("https://api.github.com/api/v1/repositories"),
        request: HttpLogRequest(),
        response: HttpLogResponse(statusCode: 200),
      ),
    ];
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

class HttpLogRequest {}

class HttpLogResponse {
  final int statusCode;

  HttpLogResponse({required this.statusCode});
}
