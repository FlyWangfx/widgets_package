import 'package:be_widgets/constants/be_theme.dart';
import 'package:flutter/material.dart';

class BEButton extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final double? height;
  final BoxConstraints constraints;
  final BorderRadiusGeometry? borderRadius;
  final Color? borderColor;
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;
  final String text;
  final Color? color;
  final double? fontSize;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

  const BEButton({
    super.key,
    this.margin,
    this.height,
    this.constraints = const BoxConstraints(minWidth: 95,minHeight: 48),
    this.borderRadius,
    this.borderColor,
    this.backgroundColor,
    this.boxShadow,
    required this.text,
    this.color,
    this.fontSize,
    this.textStyle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      constraints: BoxConstraints(
        minWidth: constraints.minWidth,
        minHeight: constraints.minHeight,
        maxWidth: constraints.maxWidth,
        maxHeight: constraints.maxHeight,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? BETheme.buttonColorBlue,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
        boxShadow: boxShadow,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          maxLines: 1,
          style: textStyle ??
              BETheme.buttonTextStyle.copyWith(
                color: color,
                fontSize: fontSize,
              ),
        ),
      ),
    );
  }
}
