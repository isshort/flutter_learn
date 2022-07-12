import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProfileScreen Title')),
      body: Center(
          child: ElevatedButton.icon(
              onPressed: () => context.go('/profile/edit'),
              icon: const Icon(Icons.edit),
              label: const Text('Profile Edit'))),
    );
  }
}
