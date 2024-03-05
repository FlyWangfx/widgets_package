import 'package:be_widgets/widgets/be_app_bar.dart';
import 'package:flutter/material.dart';

class BEScaffold extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final BEAppBarStyle style;
  final Color? bgColor;
  final String? bgImage;
  final String? bgImagePackage;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final List<Widget>? persistentFooterButtons;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final VoidCallback? onPressedBack;

  const BEScaffold({
    Key? key,
    required this.title,
    this.actions,
    this.style = BEAppBarStyle.white,
    this.bgColor,
    this.bgImage,
    this.bgImagePackage,
    this.body,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.persistentFooterButtons,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.onPressedBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BEAppBar(
        title: title,
        actions: actions,
        style: style,
        onPressedBack: onPressedBack,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: bgColor,
          image: bgImage != null
              ? DecorationImage(
                  image: AssetImage(
                    bgImage!,
                    package: bgImagePackage,
                  ),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      persistentFooterButtons: persistentFooterButtons,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
