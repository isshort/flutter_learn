import 'package:flutter/material.dart';

class FilterView extends StatefulWidget {
  const FilterView({
    super.key,
    required this.university,
  });

  final List<String> university;

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  late final List<String> _university;
  List<String> filteredItems = [];
  @override
  void initState() {
    super.initState();
    _university = widget.university;
    filteredItems = widget.university;
  }

  void _findItems(String name) {
    setState(() {
      filteredItems = _university
          .where(
            (element) => element.toLowerCase().contains(name.toLowerCase()),
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
                  title: Text(filteredItems[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
