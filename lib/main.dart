import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:loco11y/areas/http_log/ui/screens/inner_screen.dart";
import "package:loco11y/shared/ui/components/sidebar.dart";

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
