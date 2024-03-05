import 'package:flutter/material.dart';

class BETag extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color backgroundColor;

  const BETag({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      constraints: const BoxConstraints(
        minWidth: 36,
        minHeight: 18,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
      ),
    );
  }
}
