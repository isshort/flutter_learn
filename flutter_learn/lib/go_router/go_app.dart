import 'package:flutter/material.dart';
import 'package:flutter_learn/go_router/router.dart';

class GoApp extends StatelessWidget {
  const GoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: customRouter.routeInformationParser,
      routerDelegate: customRouter.routerDelegate,
      title: "Go Router Example",
      theme: ThemeData(useMaterial3: true),
    );
  }
}
