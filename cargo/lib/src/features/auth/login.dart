import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 34),
            children: [
              const CustomField(),
              const CustomField(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child:
                    ElevatedButton(onPressed: () {}, child: const Text('Next')),
              ),
              OverflowBar(
                alignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Next')),
                  ElevatedButton(onPressed: () {}, child: const Text("Done")),
                ],
              )
              // Expanded(child: CustomField()),
            ]),
      ),
    );
  }
}

class CustomField extends StatelessWidget {
  const CustomField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          labelText: 'UserName',
        ),
      ),
    );
  }
}
