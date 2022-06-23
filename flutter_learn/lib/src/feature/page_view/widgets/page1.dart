import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: true,
        title: const Text('Page1'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/page2');
            },
            child: const Text("Go To Page2"),
          ),
          const SizedBox(
            height: 4,
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/');
            },
            child: const Text("Go To Home"),
          ),
        ],
      ),
    );
  }
}
