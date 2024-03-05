import 'package:flutter/material.dart';

class BECircleMark extends StatelessWidget {
  final String text;
  final Color circleColor;

  const BECircleMark({
    super.key,
    required this.text,
    required this.circleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: circleColor,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
