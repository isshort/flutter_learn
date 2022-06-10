import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../src/feature/home/home.dart';
import '../src/feature/page_view/widgets/page1.dart';
import '../src/feature/page_view/widgets/page2.dart';

final GoRouter customRouter = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const HomePage();
    },
  ),
  GoRoute(
    path: '/page1',
    builder: (BuildContext context, GoRouterState state) {
      return const Page1();
    },
  ),
  GoRoute(
    path: '/page2',
    builder: (BuildContext context, GoRouterState state) {
      return const Page2();
    },
  ),
]);
