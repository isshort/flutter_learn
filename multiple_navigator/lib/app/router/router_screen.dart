import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multiple_navigator/app/router/root_layout.dart';
import 'package:multiple_navigator/views/basket/basket_screen.dart';
import 'package:multiple_navigator/views/home/home_screen.dart';
import 'package:multiple_navigator/views/navigation/navigation_screen.dart';
import 'package:multiple_navigator/views/profile/profile_screen.dart';
import 'package:multiple_navigator/views/search/search_screen.dart';

import '../../views/navigation/navigation_page.dart';

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
      builder: (context, state) => const BasketScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ]);
}
