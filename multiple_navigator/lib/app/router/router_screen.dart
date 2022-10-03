import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multiple_navigator/app/router/root_layout.dart';
import 'package:multiple_navigator/modules/home/home.dart';

import '../../modules/basket/view/basket_screen.dart';
import '../../modules/profile/profile_edit.dart';
import '../../modules/profile/profile_screen.dart';
import '../../modules/search/search_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final goRouter = GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    routerNeglect: true,
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) =>
              ScaffoldWithBottomNavBar(child: child),
          routes: [
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: HomeScreen()),
              routes: [
                GoRoute(
                    path: 'edit',
                    builder: (context, state) => const HomeScreenEdit(),
                    routes: [
                      GoRoute(
                        path: 'edit',
                        builder: (context, state) => const HomeScreenEdit(),
                      )
                    ])
              ],
            ),
            GoRoute(
              path: '/search',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SearchScreen()),
            ),
            GoRoute(
              path: '/basket',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: BasketScreen()),
            ),
            GoRoute(
              path: '/profile',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ProfileScreen()),
              routes: [
                GoRoute(
                  path: 'edit',
                  builder: (context, state) => const ProfileEdit(),
                ),
              ],
            ),
          ]),
    ]);
// class GoRouterScreen {
//   final goRouter = GoRouter(routes: [
//     // GoRoute(
//     //   path: '/',
//     //   builder: (context, state) => const NavigationPage(),
//     // ),
//     GoRoute(
//       path: '/',
//       pageBuilder: (context, state) => const MaterialPage<void>(
//         key: _pageKey,
//         child: RootLayout(
//           key: _scaffoldKey,
//           currentIndex: 0,
//           child: HomeScreen(),
//         ),
//       ),
//     ),
//     GoRoute(
//       path: '/home/edit',
//       pageBuilder: (context, state) => const MaterialPage<void>(
//         key: _pageKey,
//         child: RootLayout(
//           key: _scaffoldKey,
//           currentIndex: 0,
//           child: HomeScreenEdit(),
//         ),
//       ),
//     ),
    // GoRoute(
    //   path: '/search',
    //   pageBuilder: (context, state) => const MaterialPage<void>(
    //     key: _pageKey,
    //     child: RootLayout(
    //       key: _scaffoldKey,
    //       currentIndex: 1,
    //       child: SearchScreen(),
    //     ),
    //   ),
    // ),
    // GoRoute(
    //   path: '/basket',
    //   pageBuilder: (context, state) => const MaterialPage<void>(
    //     key: _pageKey,
    //     child: RootLayout(
    //       key: _scaffoldKey,
    //       currentIndex: 2,
    //       child: BasketScreen(),
    //     ),
    //   ),
    // ),
    // GoRoute(
    //     path: '/profile',
    //     pageBuilder: (context, state) => const MaterialPage<void>(
    //           key: _pageKey,
    //           child: RootLayout(
    //             key: _scaffoldKey,
    //             currentIndex: 3,
    //             child: ProfileScreen(),
    //           ),
    //         ),
    //     routes: [
    //       GoRoute(
    //         path: 'edit',
    //         builder: (context, state) => const ProfileEdit(),
    //       ),
    //     ]),
//   ]);
// }
