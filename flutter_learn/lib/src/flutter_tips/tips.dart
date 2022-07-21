import 'package:flutter/material.dart';

class FlutterTips extends StatefulWidget {
  const FlutterTips({Key? key}) : super(key: key);

  @override
  State<FlutterTips> createState() => _FlutterTipsState();
}

class _FlutterTipsState extends State<FlutterTips> {
  ListTileData listTileData = ListTileData();
  @override
  Widget build(BuildContext context) {
    List<Padding> _items = listTileData.lists();

    return Scaffold(
      appBar: AppBar(title: const Text('FlutterTips Title')),
      body: ReorderableListView.builder(
        itemBuilder: (context, index) => _items[index],
        itemCount: _items.length,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}

class IndexedStackWidget extends StatelessWidget {
  const IndexedStackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IndexedStack(index: 4, children: [
      const Text('1 FirstOne'),
      const Text('2 second'),
      const Text('3 FirstOne'),
      const Text('4 FirstOne'),
      ColorFiltered(
        colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.modulate),
        child: Container(color: Colors.green),
      )
    ]);
  }
}

class ListTileData {
  List<Padding> lists() {
    List<Padding> items = [];
    for (var i = 0; i < 20; i++) {
      items.add(
        Padding(
          key: Key('$i'),
          padding: EdgeInsets.all(2),
          child: ListTile(
            tileColor: Color.fromARGB(255, 220, 228, 200),
            leading: const Icon(Icons.notification_add),
            title: Text("Item $i"),
          ),
        ),
      );
    }
    return items;
  }
}
