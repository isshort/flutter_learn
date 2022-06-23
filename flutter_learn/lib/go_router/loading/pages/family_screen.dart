import 'package:flutter/material.dart';

class FamilyScreen extends StatelessWidget {
  const FamilyScreen({super.key, required this.fid});

  final String fid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FamilyScreen Title')),
    );
  }
}
