import 'package:flutter/material.dart';

import '../radius/radius.dart';

class CustomDecoration extends BoxDecoration {
  /// You can use [colorScheme.error]  and [colorScheme.onSurface]
  CustomDecoration({required this.colorScheme})
      : super(
          borderRadius: CustomRadius.circular(),
          gradient: LinearGradient(
            colors: [
              colorScheme.error,
              colorScheme.onSurface,
            ],
          ),
        );
  final ColorScheme colorScheme;
}
