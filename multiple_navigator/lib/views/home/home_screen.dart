import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeScreen Title')),
      body: Center(
          child: ElevatedButton.icon(
              onPressed: () => context.go('/home/edit'),
              icon: const Icon(Icons.edit),
              label: const Text('Home Edit'))),
    );
  }
}
