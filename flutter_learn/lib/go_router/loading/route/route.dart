import 'package:flutter/material.dart';
import 'package:flutter_learn/go_router/loading/app.dart';
import 'package:flutter_learn/go_router/loading/pages/family_screen.dart';
import 'package:flutter_learn/go_router/loading/pages/home_screen.dart';
import 'package:flutter_learn/go_router/loading/pages/person_screen.dart';
import 'package:go_router/go_router.dart';

import '../pages/authOverlay.dart';
import '../pages/loading_screen.dart';
import '../pages/login_screen.dart';

// GoRouter goRouter = GoRouter(
//     routes: <GoRoute>[
//       GoRoute(
//         path: '/login',
//         builder: (BuildContext context, GoRouterState state) {
//           return const LoginScreen();
//         },
//       ),
//       GoRoute(
//         path: '/loading',
//         builder: (BuildContext context, GoRouterState state) {
//           return const LoadingScreen();
//         },
//       ),
//       GoRoute(
//         path: '/',
//         builder: (BuildContext context, GoRouterState state) {
//           return const HomeScreen();
//         },
//         routes: <GoRoute>[
//           GoRoute(
//             path: 'family/:fid',
//             builder: (BuildContext context, GoRouterState state) {
//               return FamilyScreen(fid: state.params['fid']!);
//             },
//           ),
//           GoRoute(
//             path: 'person/:pid',
//             builder: (BuildContext context, GoRouterState state) {
//               return PersonScreen(
//                 fid: state.params['fid'] ?? '',
//                 pid: state.params['pid'] ?? '',
//               );
//             },
//           ),
//         ],
//       ),
//     ],
//     redirect: (GoRouterState state) {
//       AppState appState = LoadingApp().appState;
//       final bool loggedIn = appState.loginInfo2.loggedIn;
//       final bool loggingIn = state.subloc == '/login';
//       final String subloc = state.subloc;
//       final String fromp1 = subloc == '/' ? '' : "?from=$subloc";
//       if (!loggedIn) {
//         return loggedIn ? null : '/login$fromp1';
//       }

//       /// wait while it's loaded

//       final bool loaded = appState.repo.value != null;
//       final bool loading = state.subloc == '/loading';
//       final String? from = state.queryParams['form'];
//       final String fromp2 = from == null ? '' : '?from=$from';
//       if (!loaded) {
//         return loading ? null : '/loading$fromp2';
//       }

//       // if the user is logged in and the repository is loaded, send them where
//       // they were going before (or home if they weren't going anywhere)
//       if (loggingIn || loading) {
//         return from ?? '/';
//       }

//       // no need to redirect at all
//       return null;
//     },
//     refreshListenable: LoadingApp().appState,
//     navigatorBuilder: (context, state, child) {
//       return LoadingApp().appState.loginInfo2.loggedIn ? AuthOverlay(child: child) : child;
//     });
