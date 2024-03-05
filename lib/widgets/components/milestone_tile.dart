import 'package:be_widgets/be_widgets.dart';
import 'package:be_widgets/constants/be_theme.dart';
import 'package:flutter/material.dart';

class MilestoneTile extends StatelessWidget {
  final String statusText;
  final String text;
  final Color color;
  final VoidCallback? onPressed;

  const MilestoneTile({
    super.key,
    required this.statusText,
    required this.text,
    this.color = const Color(0xff8294ab),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text(
            statusText,
            style: TextStyle(
              color: color,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            width: 20,
            height: 70,
            margin: const EdgeInsets.only(left: 15, right: 8),
            child: Stack(
              children: [
                VerticalDivider(
                  thickness: 4,
                  color: Colors.black.withOpacity(0.04),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 28),
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BEButton(
              text: text,
              textStyle: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              borderRadius: BorderRadius.circular(4),
              borderColor: color,
              backgroundColor: Colors.white,
              boxShadow: const [BETheme.boxShadow],
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
