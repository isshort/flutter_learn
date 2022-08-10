import 'package:flutter/material.dart';

abstract class IFilter {
  String get key;
  int get id;
}

class FilterView<T extends IFilter> extends StatefulWidget {
  const FilterView({
    super.key,
    required this.values,
  });

  final List<T> values;

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState<T> extends State<FilterView> {
  late final List<IFilter> _university;
  List<IFilter> filteredItems = [];
  @override
  void initState() {
    super.initState();
    _university = widget.values;
    filteredItems = widget.values;
  }

  void _findItems(String name) {
    setState(() {
      filteredItems = _university
          .where(
            (element) => element.key == name,
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: const [
              Spacer(),
              SizedBox(
                width: 50,
                child: Divider(thickness: 10),
              ),
              Spacer(),
              Icon(Icons.close)
            ],
          ),
          TextField(
            onChanged: _findItems,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => Navigator.of(context).pop(filteredItems[index]),
                  title: Text(filteredItems[index].key),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
