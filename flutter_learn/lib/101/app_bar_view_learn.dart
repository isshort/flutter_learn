import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarViewLearn extends StatelessWidget {
  const AppBarViewLearn({Key? key}) : super(key: key);

  final String _title = 'Hello';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
        ),
        centerTitle: false,
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leadingWidth: 23,
        actionsIconTheme: const IconThemeData(color: Colors.red),
        leading: const Icon(Icons.chevron_left),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.mark_email_read)),
          const Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
