import "package:riverpod_annotation/riverpod_annotation.dart";
part "http_log_persister.g.dart";

@riverpod
class HttpLogPersister extends _$HttpLogPersister {
  @override
  Future<List<CaughtHttpRequest>> build() async {
    return [
      CaughtHttpRequest(),
      CaughtHttpRequest(),
      CaughtHttpRequest(),
    ];
  }
}

class CaughtHttpRequest {}
