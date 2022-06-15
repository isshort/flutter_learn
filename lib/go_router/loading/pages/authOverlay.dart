import 'package:flutter/material.dart';

class AuthOverlay extends StatelessWidget {
  const AuthOverlay({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AuthOverlay Title')),
    );
  }
}
