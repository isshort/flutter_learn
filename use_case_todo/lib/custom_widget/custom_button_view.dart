import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class CustomButtonView extends StatelessWidget {
  const CustomButtonView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CustomButtonView Title')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CustomButton(
            title: 'Click Me',
          ),
          CustomImage(
            url: '',
          )
        ],
      ),
    );
  }
}
