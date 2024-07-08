import "dart:convert";
import "dart:typed_data";

import "package:flutter/widgets.dart";
import "package:loco11y/areas/http_log/ui/components/code_block.dart";
import "package:loco11y/areas/http_log/utils/content_type_helpers.dart";

class HttpContent extends StatelessWidget {
  final String contentType;
  final Uint8List? body;

  const HttpContent({
    super.key,
    required this.contentType,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    if (body == null || body!.isEmpty) {
      return _EmptyHttpResponseContent();
    }

    return isTextualMimeType(contentType)
        ? _TextualHttpResponseContent(body: body!)
        : _BinaryHttpResponseContent();
  }
}

class _EmptyHttpResponseContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _TextualHttpResponseContent extends StatelessWidget {
  final Uint8List body;

  const _TextualHttpResponseContent({
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final text = utf8.decode(
      body,
      allowMalformed: true,
    );

    return CodeBlock(body: text);
  }
}

class _BinaryHttpResponseContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
