import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multiple_navigator/app/bloc/authentication_bloc.dart';
import 'package:multiple_navigator/type/authentication_status_type.dart';

import '../../app/bloc/authentication_event.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProfileScreen Title')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              context.read<AuthenticationBloc>().add(
                  const AuthenticationStatusChanged(
                      AuthenticationStatusType.authenticated,
                      name: "Nematullah"));
            },
            icon: const Icon(Icons.edit),
            label: const Text('Auth Status Changed'),
          ),
          ElevatedButton.icon(
            onPressed: () => context.go('/profile/edit'),
            icon: const Icon(Icons.edit),
            label: const Text('Profile Edit'),
          ),
        ],
      ),
    );
  }
}
