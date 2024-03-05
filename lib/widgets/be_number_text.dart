import 'package:flutter/material.dart';

class BENumberText extends StatelessWidget {
  final CrossAxisAlignment alignment;
  final String number;
  final Color numberColor;
  final double numberFontSize;
  final String? unit;
  final String text;
  final Color textColor;
  final double textFontSize;

  const BENumberText({
    super.key,
    this.alignment = CrossAxisAlignment.center,
    required this.number,
    this.numberColor = Colors.white,
    this.numberFontSize = 20,
    this.unit,
    required this.text,
    this.textColor = Colors.white,
    this.textFontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: alignment,
      children: [
        RichText(
          text: TextSpan(
            text: number,
            style: TextStyle(
              color: numberColor,
              fontSize: numberFontSize,
            ),
            children: unit != null
                ? [
                    TextSpan(
                      text: unit,
                      style: TextStyle(
                        color: numberColor.withOpacity(0.75),
                        fontSize: textFontSize,
                      ),
                    )
                  ]
                : null,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: textFontSize,
          ),
        ),
      ],
    );
  }
}
