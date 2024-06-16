import "package:flutter/material.dart";
import "package:loco11y/features/http_log/request_detail.dart";
import "package:loco11y/features/http_log/request_summary.dart";

class HttpLogInnerScreen extends StatelessWidget {
  const HttpLogInnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              children: const [
                RequestSummary(),
                RequestSummary(),
              ],
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: RequestDetail(),
            ),
          ),
        ],
      ),
    );
  }
}
