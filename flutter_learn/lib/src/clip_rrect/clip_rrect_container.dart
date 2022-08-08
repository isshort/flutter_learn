import 'dart:ui';

import 'package:flutter/material.dart';

class ClipRRectContainer extends StatelessWidget {
  const ClipRRectContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ClipRRectContainer Title')),
      body: ListView.builder(
        itemBuilder: (context, index) => const ClipRRectBox(),
        itemCount: 34,
      ),
    );
  }
}

class ClipRRectBox extends StatelessWidget {
  const ClipRRectBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 50),
        child: Container(
          height: 250,
          width: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color.fromARGB(31, 39, 48, 129)),
          child: const Text("Test field"),
        ),
      ),
    );
  }
}
