import 'package:flutter/material.dart';

import 'package:use_case_todo/generic_filter/mixin/show_sheet_mixin.dart';

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

extension FilterViewExtension on FilterView {
  Future<T?> showSheet<T extends IFilter>(
      {required BuildContext context, required List<T> items}) {
    return ShowSheetMixin.showCustomBottomSheet<T>(
      context: context,
      child: FilterView<T>(values: items),
    );
  }
}
