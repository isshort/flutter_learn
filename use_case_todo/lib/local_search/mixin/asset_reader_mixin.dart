import 'dart:convert';

import 'package:flutter/material.dart';

mixin AssetMixin<T extends StatefulWidget> on State<T> {
  Future<Map<String, dynamic>?> readData(String path) async {
    final dataString = await DefaultAssetBundle.of(context).loadString(path);
    if (dataString.isEmpty) return null;
    final jsonBody = jsonDecode(dataString);

    if (jsonBody is Map<String, dynamic>) {
      return jsonBody;
    }
    return null;
  }
}
