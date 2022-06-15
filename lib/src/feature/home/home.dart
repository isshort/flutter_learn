import 'package:flutter/material.dart';

import 'package:flutter_learn/src/feature/password_cubit/password.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const SelectableText('Selectable Text'),
          ElevatedButton(
              onPressed: () {
                context.go('/page1');
              },
              child: const Text("Go to Page1")),
          // const PasswordWithCubitField(),
          // const InputChip(label: Text('Input 1'), avatar: Icon(Icons.remove)),
          // ChoiceChip(label: Text('some other'), selected: true),
          // ChoiceChip(label: Text('some other'), selected: false),
          // MaterialBanner(content: const Text('some data'), actions: [
          //   TextButton(
          //     child: const Text('ACTION 1'),
          //     onPressed: () {},
          //   ),
          // ]),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Approved"),
        backgroundColor: Colors.pink,
        icon: const Icon(Icons.thumb_up),
      ),
    );
  }
}
