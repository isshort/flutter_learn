import 'package:flutter/material.dart';

import 'package:use_case_todo/local_search/mixin/asset_reader_mixin.dart';
import 'package:use_case_todo/local_search/model/service.dart';

class LocalSearchView extends StatefulWidget {
  const LocalSearchView({super.key});

  @override
  State<LocalSearchView> createState() => _LocalSearchViewState();
}

class _LocalSearchViewState extends State<LocalSearchView> with AssetMixin {
  Services? services;
  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    final data = await readData('assets/json/10k.json');
    if (data == null) return;
    setState(() {
      services = Services.fromJson(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(services?.header?.verb ?? '')),
    );
  }
}
