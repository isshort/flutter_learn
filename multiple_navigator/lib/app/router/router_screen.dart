import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multiple_navigator/app/router/root_layout.dart';

import '../../modules/modules.dart';

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

class GoRouterScreen {
  final goRouter = GoRouter(routes: [
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => const NavigationPage(),
    // ),
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: 0,
          child: HomeScreen(),
        ),
      ),
    ),
    GoRoute(
      path: '/home/edit',
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: 0,
          child: HomeScreenEdit(),
        ),
      ),
    ),
    GoRoute(
      path: '/search',
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: 1,
          child: SearchScreen(),
        ),
      ),
    ),
    GoRoute(
      path: '/basket',
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: 2,
          child: BasketScreen(),
        ),
      ),
    ),
    GoRoute(
        path: '/profile',
        pageBuilder: (context, state) => const MaterialPage<void>(
              key: _pageKey,
              child: RootLayout(
                key: _scaffoldKey,
                currentIndex: 3,
                child: ProfileScreen(),
              ),
            ),
        routes: [
          GoRoute(
            path: 'edit',
            builder: (context, state) => const ProfileEdit(),
          ),
        ]),
  ]);
}
