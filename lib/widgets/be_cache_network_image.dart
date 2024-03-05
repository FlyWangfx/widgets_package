import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BECachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fitType;
  final double? width;
  final double? height;
  final ImageProvider? placeholderImage;
  final double? placeholderWidgetWidth;
  final double? placeholderWidgetHeight;
  final BoxFit? placeholderWidgetFitType;
  final ImageProvider? errorImage;
  final double? errorWidgetWidth;
  final double? errorWidgetHeight;
  final BoxFit? errorWidgetFitType;

  const BECachedNetworkImage({
    Key? key,
    required this.imageUrl,
    this.fitType,
    this.width,
    this.height,
    this.placeholderImage,
    this.placeholderWidgetWidth,
    this.placeholderWidgetHeight,
    this.placeholderWidgetFitType,
    this.errorImage,
    this.errorWidgetWidth,
    this.errorWidgetHeight,
    this.errorWidgetFitType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fitType,
      imageUrl: imageUrl,
      placeholder: (_, __) => Image(
        image: placeholderImage ?? errorImage!,
        width: placeholderWidgetWidth ?? errorWidgetWidth,
        height: placeholderWidgetHeight ?? errorWidgetHeight,
        fit: placeholderWidgetFitType ?? errorWidgetFitType,
      ),
      errorWidget: (_, __, ___) => Image(
        image: errorImage ?? placeholderImage!,
        width: errorWidgetWidth ?? placeholderWidgetWidth,
        height: errorWidgetHeight ?? placeholderWidgetHeight,
        fit: errorWidgetFitType ?? placeholderWidgetFitType,
      ),
    );
  }
}
