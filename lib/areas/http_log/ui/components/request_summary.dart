import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:loco11y/areas/http_log/proxy/http_log_persister.dart";
import "package:loco11y/shared/ui/theme/app_colors.dart";

class RequestSummary extends ConsumerWidget {
  final bool active;
  final HttpLog request;
  final VoidCallback onTap;

  const RequestSummary({
    super.key,
    required this.active,
    required this.request,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: const Border(
            bottom: BorderSide(color: Colors.black),
          ),
          color: active ? AppColors.listItemActive : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${request.method} ${request.uri.host}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${request.receivedAt.hour}:${request.receivedAt.minute}",
                    style: const TextStyle(color: AppColors.subtleForeground),
                  ),
                ],
              ),
            ),
            Badge(
              backgroundColor: AppColors.badgeSuccess,
              label: Text(request.response.statusCode.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
