import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:loco11y/areas/http_log/proxy/proxy_server.dart";
import "package:loco11y/areas/http_log/ui/screens/inner_screen.dart";
import "package:loco11y/shared/ui/components/sidebar.dart";

void main() async {
  final container = ProviderContainer();

  await runProxyServer(container);

  runApp(UncontrolledProviderScope(
    container: container,
    child: const Loco11yApp(),
  ));
}

class Loco11yApp extends StatelessWidget {
  const Loco11yApp({super.key});

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
