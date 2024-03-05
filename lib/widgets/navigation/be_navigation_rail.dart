import 'package:be_widgets/be_widgets.dart';
import 'package:be_widgets/constants/be_theme.dart';
import 'package:flutter/material.dart';

class BENavigationRailDestination {
  final String text;

  BENavigationRailDestination(this.text);
}

class BENavigationRail extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? leading;
  final Widget? trailing;
  final List<BENavigationRailDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  const BENavigationRail({
    super.key,
    this.backgroundColor,
    this.leading,
    this.trailing,
    required this.destinations,
    required this.selectedIndex,
    this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor = backgroundColor ?? Colors.white;
    return Material(
      color: bgColor,
      child: SafeArea(
        child: Column(
          children: [
            if (leading != null) leading!,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < destinations.length; i++)
                    BEButton(
                      onPressed: () => onDestinationSelected?.call(i),
                      text: destinations[i].text,
                      fontSize: 14,
                      color: selectedIndex == i ? Colors.white : Colors.black,
                      backgroundColor: selectedIndex == i ? const Color(0xff1060a1) : bgColor,
                      borderRadius:
                          selectedIndex == i ? BorderRadius.circular(BETheme.buttonMinHeight / 2) : BorderRadius.zero,
                    ),
                ],
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
