import 'package:flutter/material.dart';

import 'package:use_case_todo/expansion_panel/page/custom_expansion.dart';

class ExpansionPanelPage extends StatelessWidget {
  const ExpansionPanelPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ExpansionPanelPage Title')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomExpansion(),
            Container(
              height: 23,
              color: Colors.red,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: const CustomExpansion(),
            ),
            const CustomExpansionTile(),
            const CustomExpansionTile(),
          ],
        ),
      ),
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ExpansionTile(
      title: Text('Hello'),
      children: [Text('data ')],
    );
  }
}
