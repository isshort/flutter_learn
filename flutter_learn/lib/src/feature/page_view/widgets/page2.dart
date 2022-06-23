import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: true,
        title: const Text('Page2'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.green,
          ),
          ElevatedButton(
              onPressed: (() {
                context.go('/page1');
              }),
              child: const Text('Go to Page1'))
        ],
      ),
    );
  }
}
