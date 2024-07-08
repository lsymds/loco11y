import "package:flutter/material.dart";

enum Language { plain }

class CodeBlock extends StatelessWidget {
  final Language language;
  final String body;

  const CodeBlock({
    super.key,
    this.language = Language.plain,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Text(body);
  }
}
