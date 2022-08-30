import 'package:flutter/material.dart';

class CustomExpansion extends StatefulWidget {
  const CustomExpansion({
    super.key,
  });

  @override
  State<CustomExpansion> createState() => _CustomExpansionState();
}

class _CustomExpansionState extends State<CustomExpansion> {
  bool isExpansion = false;
  void changeExpansion() {
    setState(() {
      isExpansion = !isExpansion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) => changeExpansion(),
      dividerColor: Colors.red,
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: Colors.blue,
          headerBuilder: (context, isExpanded) => const ListTile(
            title: Text('List Tile'),
          ),
          body: const Text('List Tile Body '),
          isExpanded: isExpansion,
        ),
      ],
    );
  }
}
