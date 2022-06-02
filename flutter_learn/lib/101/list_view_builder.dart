import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemCount: 15,
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.red,
          );
        },
        itemBuilder: (context, index) {
          print('index $index');
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                Expanded(child: Image.network('https://picsum.photos/200/300/?blur=2')),
                Text('$index'),
              ],
            ),
          );
        },
      ),
    );
  }
}
