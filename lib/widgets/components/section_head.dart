import 'package:flutter/material.dart';

class SectionHead extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final String? subtitle;
  final Color? subtitleColor;
  final Widget? trailing;

  const SectionHead({
    super.key,
    required this.title,
    this.titleColor,
    this.subtitle,
    this.subtitleColor,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 20),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 7),
            width: 4,
            height: 14,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(46, 128, 210, 1),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: titleColor ?? Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (subtitle != null)
                  Flexible(
                    child: Text(
                      subtitle!,
                      style: TextStyle(
                        color: subtitleColor ?? Colors.white.withOpacity(0.5),
                        fontSize: 14,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
