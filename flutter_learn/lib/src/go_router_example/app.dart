import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn/src/go_router_example/cubit/auth_cubit.dart';
import 'package:flutter_learn/src/go_router_example/router.dart';

class GoRouterApp extends StatelessWidget {
  const GoRouterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter(context.read<AuthCubit>().state).router;
    return MaterialApp.router(
      title: "go Router",
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
