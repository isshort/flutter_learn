import 'package:cargo/src/features/auth/login.dart';
import 'package:cargo/src/features/home/home.dart';
import 'package:cargo/src/sample_feature/sample_item_details_view.dart';
import 'package:cargo/src/sample_feature/sample_item_list_view.dart';
import 'package:cargo/src/settings/settings_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> routeGenerate(RouteSettings routeSettings) {
  return MaterialPageRoute<void>(
    settings: routeSettings,
    builder: (BuildContext context) {
      switch (routeSettings.name) {
        case SettingsView.routeName:
          return const LoginPage();
        // return SettingsView(controller: settingsController);
        case SampleItemDetailsView.routeName:
          return const SampleItemDetailsView();
        case SampleItemListView.routeName:
        default:
          return HomePage();
        // return const SampleItemListView();
      }
    },
  );
}
