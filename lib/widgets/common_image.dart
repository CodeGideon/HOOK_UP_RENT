import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

final newworkUriRef = RegExp('^http');
final localUriRef = RegExp('^static');

class CommonImage extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const CommonImage({required this.src, this.width, this.height, this.fit});

  @override
  Widget build(BuildContext context) {
    if (newworkUriRef.hasMatch(src)) {
      return CachedNetworkImage(
        imageUrl: src,
        width: width,
        height: height,
      );
    }
    if (localUriRef.hasMatch(src)) {
      return Image.asset(
        src,
        width: width,
        height: height,
        fit: fit,
      );
    }
    assert(false, '图片地址src不合法');
    return Container();
  }
}
