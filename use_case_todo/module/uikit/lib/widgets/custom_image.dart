import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({Key? key, required this.url}) : super(key: key);
  final String? url;

  String get _url => (url?.isEmpty ?? true) ? '' : url!;
  @override
  Widget build(BuildContext context) {
    return _url.isEmpty
        ? AssetImages.mine.toJpg
        : CachedNetworkImage(imageUrl: _url);
  }
}

enum AssetImages {
  mine('mine');

  final String name;
  const AssetImages(this.name);

  Widget get toJpg {
    return Image.asset(
      'asset/$name.jpg',
      package: 'uikit',
    );
  }
}
