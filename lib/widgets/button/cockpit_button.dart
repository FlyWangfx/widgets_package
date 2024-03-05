import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CockpitButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool selected;
  final double? height;

  const CockpitButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.selected = false,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    const double fontSize = 16;
    return Container(
      height: height,
      constraints: BoxConstraints(
        maxHeight: height ?? 42,
      ),
      decoration: BoxDecoration(
        gradient: selected
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, .5, 1],
                colors: [
                  Color.fromRGBO(0, 166, 255, .1),
                  Color.fromRGBO(0, 166, 255, 0.4),
                  Color.fromRGBO(130, 215, 255, .4),
                ],
              )
            : null,
      ),
      child: SizedBox(
        height: height,
        child: TextButton(
          onPressed: onPressed,
          child: AutoSizeText(
            text,
            maxLines: 1,
            maxFontSize: fontSize,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: Colors.white.withOpacity(selected ? 1 : 0.8),
            ),
          ),
        ),
      ),
    );
  }
}
