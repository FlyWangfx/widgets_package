import 'package:be_widgets/be_widgets.dart';
import 'package:flutter/material.dart';

class CockpitBottomBarItem {
  final String text;
  final bool isEarth;

  const CockpitBottomBarItem({
    required this.text,
    this.isEarth = false,
  });
}

class CockpitBottomBar extends StatelessWidget {
  final List<CockpitBottomBarItem> items;
  final int currentIndex;
  final ValueChanged<int>? onItemSelected;
  final bool centerEarth;

  const CockpitBottomBar({
    super.key,
    required this.items,
    this.currentIndex = 0,
    this.onItemSelected,
    this.centerEarth = true,
  });

  int get earthItemIndex => items.indexWhere((element) => element.isEarth);

  bool get hasEarthItem => earthItemIndex != -1;

  CockpitBottomBarItem? get earthItem => hasEarthItem ? items[earthItemIndex] : null;

  List<CockpitBottomBarItem> get leftItems => hasEarthItem ? items.sublist(0, earthItemIndex) : items;

  List<CockpitBottomBarItem> get rightItems => hasEarthItem ? items.sublist(earthItemIndex + 1) : [];

  int getItemFlex(int index, bool centerEarth) {
    if(!centerEarth) return 1;
    if(!hasEarthItem) return 1;
    bool isLeft = index < earthItemIndex;
    if(isLeft) return rightItems.length;
    return leftItems.length;
  }

  @override
  Widget build(BuildContext context) {
    double bottom = MediaQuery.of(context).padding.bottom;
    const double tabHeight = 42;
    const double earthWidth = 126;
    double heightFactor = (earthWidth / 2 + tabHeight / 2 + bottom) / earthWidth;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          constraints: BoxConstraints(
            minHeight: tabHeight,
            maxHeight: tabHeight + bottom,
          ),
          color: const Color.fromRGBO(10, 15, 20, 1).withOpacity(.6),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (int i = 0; i < items.length; i++)
              items[i].isEarth
                  ? SizedBox(
                      width: earthWidth,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ClipRect(
                            child: Align(
                              alignment: Alignment.topCenter,
                              heightFactor: heightFactor,
                              child: const CockpitEarth(width: earthWidth),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: bottom),
                            child: CockpitButton(
                              height: tabHeight,
                              selected: i == currentIndex,
                              text: items[i].text,
                              onPressed: () => onItemSelected?.call(i),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      flex: getItemFlex(i, centerEarth),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: bottom),
                        child: CockpitButton(
                          height: tabHeight,
                          selected: i == currentIndex,
                          text: items[i].text,
                          onPressed: () => onItemSelected?.call(i),
                        ),
                      ),
                    ),
          ],
        ),
      ],
    );
  }
}
