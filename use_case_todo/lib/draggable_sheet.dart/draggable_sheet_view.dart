import 'package:flutter/material.dart';

class DraggableSheetView extends StatelessWidget {
  const DraggableSheetView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DraggableSheetView Title')),
      body: Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) => ListTile(
              title: Text('Item is $index'),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.2,
            maxChildSize: 0.9,
            builder: (context, scrollController) => DecoratedBox(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(23)),
                color: Color.fromARGB(255, 162, 177, 178),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text('data'),
                    ListView.builder(
                      controller: scrollController,
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (context, index) => ListTile(
                        title: Text('Item is $index'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
