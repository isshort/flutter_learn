import 'package:flutter/cupertino.dart';
import 'package:flutter_learn/src/go_router_example/cubit/auth_cubit.dart';
import 'package:flutter_learn/src/go_router_example/pages/go_home1.dart';
import 'package:flutter_learn/src/go_router_example/pages/go_login.dart';
import 'package:flutter_learn/src/go_router_example/pages/go_logout.dart';
import 'package:flutter_learn/src/go_router_example/pages/go_register.dart';
import 'package:go_router/go_router.dart';

import '../nested_tabbar/nested_tabbar_view.dart';

class AppRouter {
  final AuthState authState;

  AppRouter(this.authState);

  late final router = GoRouter(
      routes: [
        GoRoute(
          path: "/",
          builder: (BuildContext context, GoRouterState state) =>
              // const ClipRRectContainer(),
              const NestedTabBarView(),
        ),
        GoRoute(
          path: "/home1",
          builder: (BuildContext context, GoRouterState state) =>
              const GoHome1Page(),
        ),
        GoRoute(
          path: "/login",
          builder: (BuildContext context, GoRouterState state) =>
              const GoLoginPage(),
        ),
        GoRoute(
          path: "/logout",
          builder: (BuildContext context, GoRouterState state) =>
              const GoLogoutPage(),
        ),
        GoRoute(
          path: "/register",
          builder: (BuildContext context, GoRouterState state) =>
              const GoRegisterPage(),
        ),
      ],
      redirect: (state) {
        // print("your state is ok $state");
        // final loggedIn = authState is AuthSuccess;
        // final loggingIn = state.subloc == '/login';
        // if (!loggedIn) return loggingIn ? null : '/login';
        // if (loggingIn) return '/';
        return null;
      });
}
