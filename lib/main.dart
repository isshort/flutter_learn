import 'package:flutter/material.dart';
import 'package:flutter_learn/src/core/locator/service_locator.dart';

import 'src/app/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

Future<void> main() async {
  await setup();
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(MyApp(settingsController: settingsController));
}
