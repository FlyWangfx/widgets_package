import 'package:be_widgets/be_widgets.dart';
import 'package:be_widgets/constants/be_theme.dart';
import 'package:flutter/material.dart';

class CockpitNumberItem {
  final String number;
  final String? unit;
  final String text;
  final Widget? child;

  CockpitNumberItem({
    required this.number,
    this.unit,
    required this.text,
    this.child,
  });
}

class CockpitNumberBoard extends StatelessWidget {
  final int? selectedIndex;
  final List<CockpitNumberItem> children;
  final ValueChanged<int>? onPressedNumber;
  final VoidCallback? onCloseChild;

  const CockpitNumberBoard({
    super.key,
    required this.children,
    this.selectedIndex,
    this.onPressedNumber,
    this.onCloseChild,
  }) : assert(selectedIndex == null || (selectedIndex >= 0 && selectedIndex < children.length));

  @override
  Widget build(BuildContext context) {
    CockpitNumberItem? selectedItem;
    if (selectedIndex != null) {
      selectedItem = children[selectedIndex!];
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BETheme.boardDecoration,
          constraints: const BoxConstraints(
            minWidth: double.infinity,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          alignment: Alignment.center,
          child: Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              for (CockpitNumberItem item in children)
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    int index = children.indexOf(item);
                    onPressedNumber?.call(index);
                  },
                  child: BENumberText(
                    alignment: CrossAxisAlignment.start,
                    number: item.number,
                    numberColor: const Color(0xff26c6f2),
                    numberFontSize: 20,
                    unit: item.unit,
                    text: item.text,
                  ),
                ),
            ],
          ),
        ),
        if (selectedIndex != null)
          Container(
            margin: const EdgeInsets.only(top: 32),
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              bottom: 8,
            ),
            decoration: BETheme.boardDecoration,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        selectedItem!.text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        onCloseChild?.call();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
                if (selectedItem?.child != null)
                  selectedItem!.child!,
              ],
            ),
          ),
      ],
    );
  }
}
