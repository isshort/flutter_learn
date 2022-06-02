import 'package:flutter/material.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      childAspectRatio: 8.0 / 9.0,
      children: [
        Card(
          child: Column(children: [
            const AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Icon(
                Icons.favorite,
                color: Colors.pink,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Title'),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text('Secondary Text'),
                ],
              ),
            )
          ]),
        )
      ],
    );
  }
}
