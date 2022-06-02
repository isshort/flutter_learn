import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImageLearnAdvanced extends StatefulWidget {
  const ImageLearnAdvanced({Key? key}) : super(key: key);

  @override
  State<ImageLearnAdvanced> createState() => _ImageLearnState();
}

class _ImageLearnState extends State<ImageLearnAdvanced> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(child: Image.asset(_ImageNames.image1.path())),
          Divider(),
          _ImageNames.image1.getWidget(height: 100.0),
        ],
      ),
    );
  }
}

enum _ImageNames { image1 }

extension _ImagePath on _ImageNames {
  String path() {
    return 'assets/png/$name.png';
  }

  Widget getWidget({height = 24.0}) {
    print(height);
    return Image.asset(
      path(),
      height: height,
    );
  }
}
