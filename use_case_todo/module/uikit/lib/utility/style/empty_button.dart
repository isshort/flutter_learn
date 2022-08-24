import 'package:flutter/material.dart';

class EmptyButtonStyle extends ButtonStyle {
  EmptyButtonStyle()
      : super(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        );
}
