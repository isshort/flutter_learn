import 'package:flutter/material.dart';
import 'package:multiple_navigator/app/router/router_screen.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = GoRouterScreen().goRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.yellow),
      ),
    );
  }
}
