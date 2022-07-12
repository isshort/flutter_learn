import 'package:connectivity_use_case/example/example_change.dart';
import 'package:connectivity_use_case/use_case/network_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const NetWorkChangeView(),
      builder: (context, child) => Column(
        children: [
          Expanded(
            child: child ?? const SizedBox(),
          ),
          const NetWorkWidget(),
        ],
      ),
    );
  }
}
