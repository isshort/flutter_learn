import 'package:flutter/material.dart';
import 'package:flutter_learn/go_router/go_app.dart';
import 'package:flutter_learn/src/core/locator/service_locator.dart';

import 'src/app/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

Future<void> main() async {
  await setup();
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  // runApp(MyApp(settingsController: settingsController));
  runApp(const GoApp());
}
