import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:loco11y/areas/http_log/proxy/http_log_persister.dart";

class RequestSummary extends ConsumerWidget {
  final CaughtHttpRequest model;
  final VoidCallback onTap;

  const RequestSummary({super.key, required this.model, required this.onTap});

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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text("POST api.github.com"),
                ),
                Text("200"),
              ],
            ),
            Text("3 minutes ago"),
          ],
        ),
      ),
    );
  }
}
