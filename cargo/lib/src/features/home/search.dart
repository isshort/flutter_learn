import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key, required Color color}) : _color = color;
  final Color _color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: _color,
    );
  }
}
