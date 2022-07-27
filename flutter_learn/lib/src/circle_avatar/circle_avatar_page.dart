import 'package:flutter/material.dart';

class CircleAvatarPage extends StatelessWidget {
  const CircleAvatarPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CircleAvatarPage Title'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Check'),
            ),
            SizedBox(
              height: 40,
            ),
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.red,
              child: Image.asset(
                'assets/images/logo1.png',
                height: 80,
                width: 80,
              ),
            )
          ],
        ),
      ),
    );
  }
}
