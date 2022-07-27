import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Sky { midnight, viridian, cerulean }

Map<Sky, Color> skyColors = <Sky, Color>{
  Sky.midnight: const Color(0xff191970),
  Sky.viridian: const Color(0xff40826d),
  Sky.cerulean: const Color(0xff007ba7),
};

class SlidingSegmentControl extends StatefulWidget {
  const SlidingSegmentControl({Key? key}) : super(key: key);

  @override
  State<SlidingSegmentControl> createState() => _SlidingSegmentControlState();
}

class _SlidingSegmentControlState extends State<SlidingSegmentControl> {
  Sky _selectedSegment = Sky.midnight;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: skyColors[_selectedSegment],
      navigationBar: CupertinoNavigationBar(
        middle: CupertinoSlidingSegmentedControl<Sky>(
          backgroundColor: CupertinoColors.systemGrey2,
          thumbColor: skyColors[_selectedSegment]!,
          groupValue: _selectedSegment,
          onValueChanged: (Sky? value) {
            if (value != null) {
              setState(() {
                _selectedSegment = value;
              });
            }
          },
          children: const <Sky, Widget>{
            Sky.midnight: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Midnight',
                style: TextStyle(
                  color: CupertinoColors.white,
                ),
              ),
            ),
            Sky.viridian: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Viridian',
                style: TextStyle(
                  color: CupertinoColors.white,
                ),
              ),
            ),
            Sky.cerulean: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Cerulean',
                style: TextStyle(
                  color: CupertinoColors.white,
                ),
              ),
            ),
          },
        ),
      ),
      child: Center(
          child: Text(
        'Selected Segement ${_selectedSegment.name}',
        style: const TextStyle(color: CupertinoColors.white, fontSize: 16),
      )),
    );
  }
}
