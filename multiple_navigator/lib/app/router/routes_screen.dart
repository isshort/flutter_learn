// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../modules/error_page.dart';
import '../../modules/login_page.dart';
import 'root_layout.dart';
import '../../modules/basket/view/basket_screen.dart';
import '../../modules/profile/profile_edit.dart';
import '../../modules/profile/profile_screen.dart';
import '../../modules/search/search_screen.dart';
import '../bloc/authentication_bloc.dart';
import '../bloc/authentication_event.dart';
import '../bloc/authentication_state.dart';
import '../../modules/home/home_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter extends Bloc<AuthenticationEvent, AuthState> {
  /// create routes with authentication bloc
  AppRouter(this.authBloc) : super(const AuthInitial());

  /// use authentication bloc for use navigation
  late final AuthenticationBloc authBloc;

  /// save previous state
  AuthState? prevAuthState;

  /// getter
  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
      redirect: (BuildContext context, GoRouterState state) async {
        if (prevAuthState == authBloc.state) {
          return null;
        }
        prevAuthState = authBloc.state;
        if (authBloc.state is AuthAuthenticated) {
          debugPrint('Authenticated');
          return '/home';
        } else if (authBloc.state is AuthUnAuthenticated) {
          debugPrint('UnAuthenticated');
          return '/login';
        } else if (authBloc.state is AuthUnknown) {
          debugPrint('AuthenticationUnknown');
        }
        debugPrint('no return somethings');
        return null;
      },
      refreshListenable: GoRouterRefreshStream(authBloc.stream),
      errorPageBuilder: (BuildContext context, GoRouterState state) {
        return MaterialPage<dynamic>(
          key: state.pageKey,
          child: ErrorPage(exception: state.error),
        );
      },
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) =>
              ScaffoldWithBottomNavBar(child: child),
          routes: [
            GoRoute(
                path: '/',
                redirect: (_, __) {
                  if (authBloc.state is AuthAuthenticated) {
                    return '/home';
                  } else {
                    return '/login';
                  }
                }),
            GoRoute(
              path: '/home',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return MaterialPage<dynamic>(
                  key: state.pageKey,
                  child: const HomePage(),
                );
              },
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
          ],
        ),
        GoRoute(
          path: '/login',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage<dynamic>(
              key: state.pageKey,
              child: const LoginPage(),
            );
          },
        ),
      ]);
}

/// stream to use go_router refreshListen
class GoRouterRefreshStream extends ChangeNotifier {
  /// notify to all subscribers.
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
