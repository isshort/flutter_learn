import 'package:flutter/material.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({Key? key}) : super(key: key);

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TextField(
        maxLength: 20,
        buildCounter: (context,
            {int? currentLength, bool? isFocused, maxLength}) {
          return AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: 10,
            width: 2.0 * (currentLength ?? 0 ~/ 2),
            color: Colors.green[100],
          );
        },
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.mail),
            border: OutlineInputBorder(),
            labelText: 'Mail'),
      ),
    );
  }
}
