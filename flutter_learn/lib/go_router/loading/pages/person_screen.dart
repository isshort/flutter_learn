import 'package:flutter/material.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key, required this.fid, required this.pid});

  final String fid;
  final String pid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PersonScreen Title')),
    );
  }
}
