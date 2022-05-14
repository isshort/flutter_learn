import 'package:flutter/material.dart';
import 'package:flutter_learn/demos/color_demos_view.dart';

class ColorLifeCycleView extends StatefulWidget {
  const ColorLifeCycleView({Key? key}) : super(key: key);

  @override
  State<ColorLifeCycleView> createState() => _ColorLifeCycleViewState();
}

class _ColorLifeCycleViewState extends State<ColorLifeCycleView> {
  Color? initializeColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [IconButton(onPressed: _changeBackground, icon: const Icon(Icons.clear))]),
      body: Column(
        children: [
          Spacer(),
          Expanded(
              child: ColorDemos(
            initialColor: initializeColor,
          )),
        ],
      ),
    );
  }

  void _changeBackground() {
    setState(() {
      initializeColor = Colors.green;
    });
  }
}
