import 'package:be_widgets/constants/be_theme.dart';
import 'package:be_widgets/widgets/button/be_button.dart';
import 'package:be_widgets/widgets/layout/be_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomButtonItem {
  final String text;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const BottomButtonItem({
    required this.text,
    this.backgroundColor,
    this.onPressed,
  });
}

class BottomButtons extends StatelessWidget {
  final List<BottomButtonItem> items;
  final ValueChanged<int>? onTap;

  const BottomButtons({
    super.key,
    required this.items,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const double maxWidth = BETheme.bottomButtonMaxWidth;
    double minWidth = (maxWidth - items.length + 1) / items.length;
    return BEBottomBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < items.length; i++)
              BEButton(
                margin: EdgeInsets.only(right: i == items.length - 1 ? 0 : 1),
                height: BETheme.buttonMinHeight,
                constraints: BoxConstraints(
                  maxWidth: maxWidth,
                  minWidth: minWidth,
                ),
                borderRadius: BorderRadius.horizontal(
                  left: i == 0 ? const Radius.circular(BETheme.buttonMinHeight / 2) : Radius.zero,
                  right: i == items.length - 1 ? const Radius.circular(BETheme.buttonMinHeight / 2) : Radius.zero,
                ),
                backgroundColor: items[i].backgroundColor ?? BETheme.buttonColorBlue,
                text: items[i].text,
                onPressed: () {
                  items[i].onPressed?.call();
                  onTap?.call(i);
                },
              ),
          ],
        ),
      ),
    );
  }
}
