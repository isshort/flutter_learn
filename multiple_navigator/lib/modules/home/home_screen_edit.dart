import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreenEdit extends StatelessWidget {
  const HomeScreenEdit({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeScreenEdit Title')),
      body: Column(
        children: [
          Center(
              child: ElevatedButton.icon(
                  onPressed: () => context.go('/home/edit/edit'),
                  icon: const Icon(Icons.edit),
                  label: const Text('Home Edit'))),
          const Placeholder(),
        ],
      ),
    );
  }
}
