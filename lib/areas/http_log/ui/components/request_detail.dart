import "package:flutter/material.dart";
import "package:loco11y/areas/http_log/proxy/http_log_persister.dart";

class RequestDetail extends StatelessWidget {
  final HttpLog request;

  const RequestDetail({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(color: Colors.lightBlue),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text("POST ${request.uri.toString()}"),
              ),
              Text(request.response.statusCode.toString()),
              const SizedBox(height: 100),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(12, 24, 12, 0),
          child: const Row(
            children: [
              Expanded(
                child: Text("Request Headers"),
              ),
              Expanded(
                child: Text("Request Body"),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(12, 200, 12, 0),
          child: const Row(
            children: [
              Expanded(
                child: Text("Response Headers"),
              ),
              Expanded(
                child: Text("Response Body"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
