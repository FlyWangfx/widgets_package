import 'package:be_widgets/be_widgets.dart';
import 'package:flutter/material.dart';

class RoleButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const RoleButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BEButton(
      onPressed: () {
        onPressed?.call();
      },
      constraints: const BoxConstraints(minWidth: 125),
      height: 40,
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 30, 60, 0.2),
          blurRadius: 9,
          spreadRadius: 1,
        ),
      ],
      borderRadius: BorderRadius.circular(4),
      backgroundColor: Colors.white.withOpacity(0.4),
      textStyle: TextStyle(
        fontSize: 16,
        color: Colors.white.withOpacity(0.8),
      ),
      text: text,
    );
  }
}
