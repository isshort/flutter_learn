// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/authentication_bloc.dart';
import 'bloc/authentication_event.dart';
import 'bloc/authentication_state.dart';
import 'page/error_page.dart';
import 'page/home_page.dart';
import 'page/login_page.dart';

/// routes
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
    routes: <RouteBase>[
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
        path: '/login',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage<dynamic>(
            key: state.pageKey,
            child: const LoginPage(),
          );
        },
      ),
    ],
    errorPageBuilder: (BuildContext context, GoRouterState state) {
      return MaterialPage<dynamic>(
        key: state.pageKey,
        child: ErrorPage(exception: state.error),
      );
    },
    debugLogDiagnostics: true,
  );
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
