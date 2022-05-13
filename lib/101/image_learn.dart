import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        const CustomImage(),
      ]),
    );
  }
}

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://avatars.mds.yandex.net/i?id=84dbd50839c3d640ebfc0de20994c30d-4473719-images-taas-consumers&n=27&h=480&w=480',
      errorBuilder: (context, error, stackTrace) =>
          const Icon(Icons.abc_outlined),
      fit: BoxFit.cover,
    );
  }
}
