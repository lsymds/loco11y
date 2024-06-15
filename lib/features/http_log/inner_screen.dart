import "package:flutter/material.dart";

class HttpLogInnerScreen extends StatelessWidget {
  const HttpLogInnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              alignment: Alignment.topLeft,
              child: const Padding(
                padding: EdgeInsets.all(24),
                child: Text("Http log"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
