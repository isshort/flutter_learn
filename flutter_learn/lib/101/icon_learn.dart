import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconLearn extends StatelessWidget {
  const IconLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Icon')),
      body: Column(children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.message_outlined,
              color: IconColor.lima,
              size: IconSize.IconSmall,
            ))
      ]),
    );
  }
}

class IconSize {
  static const double IconSmall = 40.0;
}

class IconColor {
  static const Color lima = Color(0xFF68E326);
}
