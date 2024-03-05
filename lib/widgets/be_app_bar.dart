import 'package:flutter/material.dart';

enum BEAppBarStyle {
  white,
  transparent,
}

class BEAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;
  final VoidCallback? onPressedBack;
  final String title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final BEAppBarStyle style;

  const BEAppBar({
    Key? key,
    this.automaticallyImplyLeading = true,
    this.onPressedBack,
    required this.title,
    this.bottom,
    this.toolbarHeight,
    this.actions,
    this.style = BEAppBarStyle.white,
  }) : super(key: key);

  @override
  _BEAppBarState createState() => _BEAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}

class _BEAppBarState extends State<BEAppBar> {
  Color getColorByStyle() {
    return widget.style == BEAppBarStyle.white ? Colors.black : Colors.white;
  }

  Color getBgColor() {
    return widget.style == BEAppBarStyle.white ? Colors.white : Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      backgroundColor: getBgColor(),
      leading: widget.automaticallyImplyLeading
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: getColorByStyle(),
              onPressed: widget.onPressedBack ??
                  () {
                    Navigator.pop(context);
                  },
            )
          : null,
      title: Text(
        widget.title,
        style: TextStyle(
          color: getColorByStyle(),
          fontSize: 18,
        ),
      ),
      actions: widget.actions,
      bottom: widget.bottom,
      centerTitle: true,
      shadowColor: getBgColor(),
      iconTheme: IconThemeData(
        color: Colors.black, //修改颜色
      ),
    );
  }
}
