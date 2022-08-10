import 'package:flutter/material.dart';
import 'package:use_case_todo/generic_filter/filter_view.dart';

import 'package:use_case_todo/generic_filter/model/university_model.dart';

class FilterHomeView extends StatefulWidget {
  const FilterHomeView({super.key});

  @override
  State<FilterHomeView> createState() => _FilterHomeViewState();
}

class _FilterHomeViewState extends State<FilterHomeView> {
  List<String> university = UniversityEnum.universityList;

  String _name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_name)),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet<String>(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(34),
              ),
            ),
            builder: (context) {
              return FilterView(university: university);
            },
          );
          if (result == null || result.isEmpty) return;
          setState(() {
            _name = result;
          });
        },
        child: const Text('show'),
      ),
    );
  }
}
