import "dart:convert";
import "dart:typed_data";

import "package:flutter/widgets.dart";
import "package:loco11y/areas/http_log/utils/content_type_helpers.dart";

class HttpContent extends StatelessWidget {
  final String contentType;
  final Uint8List body;

  const HttpContent({
    super.key,
    required this.contentType,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return isTextualMimeType(contentType)
        ? _TextualHttpResponseContent(body: body)
        : _BinaryHttpResponseContent();
  }
}

class _TextualHttpResponseContent extends StatelessWidget {
  final Uint8List body;

  const _TextualHttpResponseContent({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      utf8.decode(
        body,
        allowMalformed: true,
      ),
    );
  }
}

class _BinaryHttpResponseContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
