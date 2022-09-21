import 'package:flutter/material.dart';

import 'package:use_case_todo/custom_card/body.dart';

class CustomCardView extends StatelessWidget {
  const CustomCardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CustomCardView Title')),
      body: Column(
        children: [
          PaymentCardBody(),
        ],
      ),
    );
  }
}
