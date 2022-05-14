import 'package:flutter/material.dart';

class ColorDemos extends StatefulWidget {
  ColorDemos({Key? key, this.initialColor}) : super(key: key);
  Color? initialColor;
  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backgroundColor;
  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialColor != _backgroundColor && widget.initialColor != null) {
      _updateColor(widget.initialColor!);
    }
  }

  void _updateColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value == TabIndex.YELLOW.index) {
              _updateColor(Colors.yellow);
            } else if (value == TabIndex.BLUE.index) {
              _updateColor(Colors.blue);
            } else if (value == TabIndex.RED.index) {
              _updateColor(Colors.red);
            }
          },
          items: [
            BottomNavigationBarItem(
                icon: _CustomBox(color: LabelColor.yellowColor), label: LabelString.yellowLable),
            BottomNavigationBarItem(
                icon: _CustomBox(color: LabelColor.redColor), label: LabelString.redLabel),
            BottomNavigationBarItem(
                icon: _CustomBox(color: LabelColor.blueColor), label: LabelString.blueLable),
          ]),
    );
  }
}

enum TabIndex {
  YELLOW,
  RED,
  BLUE,
}

class _CustomBox extends StatelessWidget {
  const _CustomBox({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      color: color,
    );
  }
}

class LabelString {
  static const yellowLable = 'Yellow';
  static const redLabel = 'Red';
  static const blueLable = 'Blue';
}

class LabelColor {
  static Color yellowColor = Colors.yellow;
  static Color redColor = Colors.red;
  static Color blueColor = Colors.blue;
}
