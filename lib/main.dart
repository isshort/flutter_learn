import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn/go_router/go_app.dart';
import 'package:flutter_learn/src/core/locator/service_locator.dart';
import 'package:flutter_learn/src/feature/material_3_demo/main.dart';
import 'package:flutter_learn/src/go_router_example/app.dart';
import 'package:flutter_learn/src/go_router_example/cubit/auth_cubit.dart';

import 'go_router/loading/app.dart';
import 'src/app/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

Future<void> main() async {
  await setup();
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  // runApp(MyApp(settingsController: settingsController));
  runApp(BlocProvider(
    create: (context) => AuthCubit(),
    child: const GoRouterApp(),
  ));
}
