import 'package:flutter/material.dart';

class BETheme {
  static const Color buttonColorBlue = Color(0xff00a0e9);
  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static const double buttonMinHeight = 48;
  static const double bottomButtonMaxWidth = 320;
  static const double bottomButtonMinWidth = 228;
  static const BoxShadow boxShadow = BoxShadow(
    color: Color.fromRGBO(0, 30, 60, 0.05),
    blurRadius: 10,
  );
  static BoxDecoration boardDecoration = BoxDecoration(
    color: const Color(0xff0a0f14).withOpacity(0.4),
    borderRadius: BorderRadius.circular(8),
  );
}
