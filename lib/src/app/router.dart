import 'package:flutter/material.dart';
import 'package:flutter_learn/src/feature/home/home.dart';
import 'package:flutter_learn/src/sample_feature/sample_item_details_view.dart';
import 'package:flutter_learn/src/sample_feature/sample_item_list_view.dart';
import 'package:flutter_learn/src/settings/settings_view.dart';

Route<dynamic> routeGenerate(RouteSettings routeSettings) {
  return MaterialPageRoute<void>(
    settings: routeSettings,
    builder: (BuildContext context) {
      switch (routeSettings.name) {
        case SettingsView.routeName:
        // return SettingsView(controller: settingsController);
        // case SampleItemDetailsView.routeName:
        //   return const SampleItemDetailsView();
        // case SampleItemListView.routeName:
        default:
          return const HomePage();
      }
    },
  );
}
