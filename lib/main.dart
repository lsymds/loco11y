import "package:flutter/material.dart";
import "package:loco11y/features/http_log/inner_screen.dart";
import "package:loco11y/shared/components/sidebar.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "loco11y",
      theme: ThemeData.light(useMaterial3: true),
      home: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return const Row(children: [
              Sidebar(),
              HttpLogInnerScreen(),
            ]);
          },
        ),
      ),
    );
  }
}
