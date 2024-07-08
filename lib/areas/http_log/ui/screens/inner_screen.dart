import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:loco11y/areas/http_log/proxy/http_log_persister.dart";
import "package:loco11y/areas/http_log/ui/components/request_detail.dart";
import "package:loco11y/areas/http_log/ui/components/request_summary.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
part "inner_screen.g.dart";

class HttpLogInnerScreenData {
  final List<HttpLog> requests;
  final HttpLog? requestBeingViewed;

  HttpLogInnerScreenData({required this.requests, this.requestBeingViewed});
}

@riverpod
class HttpLogInnerScreenDataManager extends _$HttpLogInnerScreenDataManager {
  @override
  Future<HttpLogInnerScreenData> build() async {
    ref.listen(
      httpLogPersisterProvider,
      (_, c) async {
        final data = await future;

        c.whenData((current) {
          state = AsyncValue.data(HttpLogInnerScreenData(
              requests: current, requestBeingViewed: data.requestBeingViewed));
        });
      },
      fireImmediately: true,
    );

    return HttpLogInnerScreenData(requests: []);
  }

  Future openRequest(HttpLog request) async {
    final data = await future;
    state = AsyncValue.data(HttpLogInnerScreenData(
        requests: data.requests, requestBeingViewed: request));
  }
}

class HttpLogInnerScreen extends ConsumerWidget {
  const HttpLogInnerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.watch(httpLogInnerScreenDataManagerProvider.notifier);
    final persistedRequests = ref.watch(httpLogInnerScreenDataManagerProvider);

    return persistedRequests.when(
      skipLoadingOnRefresh: true,
      skipLoadingOnReload: true,
      loading: () => const SizedBox(),
      error: (_, __) => const SizedBox(),
      data: (data) {
        return Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 300,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.black),
                  ),
                ),
                child: ListView(
                  children: data.requests
                      .map(
                        (r) => RequestSummary(
                          active: r == data.requestBeingViewed,
                          request: r,
                          onTap: () => manager.openRequest(r),
                        ),
                      )
                      .toList(),
                ),
              ),
              if (data.requestBeingViewed != null)
                Expanded(
                  child: SingleChildScrollView(
                    child: RequestDetail(
                      request: data.requestBeingViewed!,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
