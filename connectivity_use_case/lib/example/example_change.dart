// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class NetWorkChangeView extends StatefulWidget {
  const NetWorkChangeView({super.key});

  @override
  State<NetWorkChangeView> createState() => _NetWorkChangeViewState();
}

class _NetWorkChangeViewState extends State<NetWorkChangeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Placeholder(),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.abc_rounded), label: 'Page1'),
        BottomNavigationBarItem(icon: Icon(Icons.abc_rounded), label: 'Page2'),
      ]),
    );
  }
}
