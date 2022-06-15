import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'data/auth.dart';
import 'data/repository.dart';
import 'pages/pages.dart';

class LoadingApp extends StatelessWidget {
  LoadingApp({super.key});

  final AppState _appState = AppState();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>.value(
      value: _appState,
      child: MaterialApp.router(
        routeInformationParser: goRouter(context).routeInformationParser,
        routerDelegate: goRouter(context).routerDelegate,
        title: "App Data",
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  String homeRouteName = 'home';
  GoRouter goRouter(BuildContext context) => GoRouter(
          routes: <GoRoute>[
            GoRoute(
              path: '/',
              builder: (BuildContext context, GoRouterState state) {
                return const HomeScreen();
              },
              routes: <GoRoute>[
                GoRoute(
                  path: 'family/:fid',
                  builder: (BuildContext context, GoRouterState state) {
                    return FamilyScreen(fid: state.params['fid']!);
                  },
                ),
                GoRoute(
                  path: 'person/:pid',
                  builder: (BuildContext context, GoRouterState state) {
                    return PersonScreen(
                      fid: state.params['fid'] ?? '',
                      pid: state.params['pid'] ?? '',
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: '/login',
              builder: (BuildContext context, GoRouterState state) {
                return const LoginScreen();
              },
            ),
            GoRoute(
              path: '/loading',
              builder: (BuildContext context, GoRouterState state) {
                return const LoadingScreen();
              },
            ),
          ],
          redirect: (state) {
            // return '/login';

            //  final bool loggedIn = _appState.loginInfo2.loggedIn;
            // final bool loggingIn = state.subloc == '/login';
            // final String subloc = state.subloc;
            // final String fromp1 = subloc == '/' ? '' : "?from=$subloc";
            // return '/'.toString();
            // if (!loggedIn) {
            //   return homeRouteName;
            // }
            // if (!loggedIn) {
            //   return loggedIn ? null : '/login$fromp1';
            // }

            // /// wait while it's loaded

            // final bool loaded = _appState.repo.value != null;
            // final bool loading = state.subloc == '/loading';
            // final String? from = state.queryParams['from'];
            // final String fromp2 = from == null ? '' : '?from=$from';
            // if (!loaded) {
            //   return loading ? null : '/loading$fromp2';
            // }

            // // if the user is logged in and the repository is loaded, send them where
            // // they were going before (or home if they weren't going anywhere)
            // if (loggingIn || loading) {
            //   return from ?? '/';
            // }

            // no need to redirect at all
            // return null;
          },
          refreshListenable: _appState,
          navigatorBuilder: (context, state, child) {
            return _appState.loginInfo2.loggedIn ? AuthOverlay(child: child) : child;
          });
}

class AppState extends ChangeNotifier {
  AppState() {
    loginInfo2.addListener(loginChange);
    repo.addListener(notifyListeners);
  }
  final LoginInfo2 loginInfo2 = LoginInfo2();

  final ValueNotifier<Repository2?> repo = ValueNotifier<Repository2?>(null);

  Future<void> loginChange() async {
    notifyListeners();

    repo.value = loginInfo2.loggedIn ? await Repository2.get(loginInfo2.username) : null;
  }

  @override
  void dispose() {
    super.dispose();
    loginInfo2.removeListener(loginChange);
    repo.removeListener(notifyListeners);
  }
}
