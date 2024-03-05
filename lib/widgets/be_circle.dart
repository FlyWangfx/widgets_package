import 'package:flutter/material.dart';

class BECircle extends StatelessWidget {
  final double? externalCircleSize;
  final double? insideCircleSize;
  final double externalCircleWidth;
  final double insideCircleWidth;
  final Color externalCircleColor;
  final Color insideCircleColor;
  final Widget component;

  const BECircle({
    Key? key,
    this.externalCircleSize,
    this.insideCircleSize,
    required this.externalCircleWidth,
    required this.externalCircleColor,
    required this.insideCircleWidth,
    required this.insideCircleColor,
    required this.component,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: externalCircleSize,
          height: externalCircleSize,
          decoration: BoxDecoration(
            border: Border.all(
              color: externalCircleColor,
              width: externalCircleWidth,
            ),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: insideCircleSize,
          height: insideCircleSize,
          decoration: BoxDecoration(
            border: Border.all(
              color: insideCircleColor,
              width: insideCircleWidth,
            ),
            shape: BoxShape.circle,
          ),
        ),
        component
      ],
    );
  }
}
