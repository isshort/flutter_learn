import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        const _CustomCard(
          child: SizedBox(
            height: 100,
            width: 300,
            child: Center(child: Text('App')),
          ),
        ),
        Card(
          color: Theme.of(context).colorScheme.error,
          child: const SizedBox(
            height: 100,
            width: 100,
          ),
        ),
      ]),
    );
  }
}

class _CustomCard extends StatelessWidget {
  const _CustomCard({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectMargin.cardMargin,
      elevation: 100,
      shape:
          const StadiumBorder(), // StadiumBorder,RoundedRactangleBorder,CircleBorder
      child: child,
    );
  }
}

class ProjectMargin {
  static const cardMargin = EdgeInsets.all(10);
}
