import 'package:flutter/material.dart';
import 'package:flutter_learn/101/image_learn.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({Key? key}) : super(key: key);
  final custom_height = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: const CustomImage(),
                    bottom: custom_height / 2,
                  ),
                  Positioned(
                      height: custom_height,
                      bottom: 10,
                      right: 10,
                      left: 10,
                      child: const Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(),
                      ))
                ],
              )),
          const Spacer(
            flex: 6,
          )
        ],
      ),
    );
  }
}
