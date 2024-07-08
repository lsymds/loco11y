import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:loco11y/areas/http_log/proxy/http_log_persister.dart";

class RequestSummary extends ConsumerWidget {
  final HttpLog request;
  final VoidCallback onTap;

  const RequestSummary({super.key, required this.request, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text("${request.method} ${request.uri.host}"),
                ),
                Text(request.response.statusCode.toString()),
              ],
            ),
            Text(request.receivedAt.toString()),
          ],
        ),
      ),
    );
  }
}
