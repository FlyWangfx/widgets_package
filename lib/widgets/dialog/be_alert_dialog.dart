import 'package:be_widgets/be_widgets.dart';
import 'package:flutter/material.dart';

class BEAlertDialog extends StatelessWidget {
  final String title;
  final Widget? content;
  final VoidCallback? onPressedCancel;
  final VoidCallback? onPressedOk;

  const BEAlertDialog({
    super.key,
    required this.title,
    this.content,
    this.onPressedCancel,
    this.onPressedOk,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      titleTextStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      content: content,
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(bottom: 30),
      actions: [
        if (onPressedCancel != null)
          BEButton(
            onPressed: () {
              onPressedCancel!();
              Navigator.of(context).pop();
            },
            backgroundColor: const Color.fromRGBO(229, 229, 229, 0.1),
            color: Colors.black.withOpacity(0.4),
            text: '取消',
          ),
        BEButton(
          onPressed: onPressedOk,
          constraints: BoxConstraints(
            minWidth: onPressedCancel == null ? 206 : 95,
          ),
          text: '确定',
        ),
      ],
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
