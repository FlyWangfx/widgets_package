import 'package:be_widgets/widgets/dialog/be_simple_dialog.dart';
import 'package:flutter/material.dart';

class MenuDialog extends StatelessWidget {
  final Widget? icon;
  final String title;
  final Widget? subtitle;
  final List<Widget> menus;

  const MenuDialog({
    super.key,
    this.icon,
    required this.title,
    this.subtitle,
    required this.menus,
  });

  @override
  Widget build(BuildContext context) {
    const double left = 22;
    return BESimpleDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: SizedBox(
                    width: 16,
                    child: icon,
                  ),
                ),
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          if (subtitle != null)
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: left,
              ),
              child: subtitle!,
            ),
        ],
      ),
      children: <SimpleDialogOption>[
        SimpleDialogOption(
          child: Padding(
            padding: const EdgeInsets.only(left: left),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                for (final widget in menus) widget,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
