import "package:flutter/material.dart";
import "package:loco11y/areas/http_log/proxy/http_log_persister.dart";
import "package:loco11y/areas/http_log/ui/components/code_block.dart";
import "package:loco11y/areas/http_log/ui/components/http_content.dart";

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
              Text("${request.response.responseTimeInMilliseconds}ms"),
              Text(request.response.statusCode.toString()),
              const SizedBox(height: 100),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(12, 24, 12, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Request Headers"),
                    CodeBlock(body: request.request.headers.toString()),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Request Body"),
                    HttpContent(
                      contentType: request.request.contentType,
                      body: request.request.body,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(12, 36, 12, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Response Headers",
                        textAlign: TextAlign.left,
                      ),
                      CodeBlock(body: request.response.headers.toString()),
                    ]),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Response Body"),
                    HttpContent(
                      contentType: request.response.contentType,
                      body: request.response.body,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
