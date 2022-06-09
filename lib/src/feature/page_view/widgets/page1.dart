import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: true,
        title: const Text('Page1'),
      ),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}
