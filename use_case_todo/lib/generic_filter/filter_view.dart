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
  late final List<IFilter> _values;
  List<IFilter> filteredItems = [];
  @override
  void initState() {
    super.initState();
    _values = widget.values;
    filteredItems = widget.values;
  }

  void _findItems(String name) {
    setState(() {
      filteredItems = _values
          .where(
            (element) => element.key == name,
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}
