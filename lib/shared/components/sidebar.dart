import "package:flutter/material.dart";

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(color: Colors.blueGrey),
      child: const Column(
        children: [
          Expanded(
            child: Text("HTTP"),
          ),
          Text("Help"),
        ],
      ),
    );
  }
}
