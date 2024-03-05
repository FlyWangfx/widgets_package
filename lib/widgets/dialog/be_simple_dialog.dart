import 'package:flutter/material.dart';

class BESimpleDialog extends StatelessWidget {
  final Widget? title;
  final List<SimpleDialogOption>? children;

  const BESimpleDialog({
    super.key,
    this.title,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: title,
      children: children,
    );
  }
}
