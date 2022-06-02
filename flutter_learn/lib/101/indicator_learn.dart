import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IndiactorLearn extends StatelessWidget {
  const IndiactorLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CircularProgressIndicator(),
        ],
      ),
      body: const CircularProgressIndicator(),
    );
  }
}
