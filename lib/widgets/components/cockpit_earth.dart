import 'package:be_widgets/constants/be_assets_res.dart';
import 'package:flutter/material.dart';

class CockpitEarth extends StatefulWidget {
  final double width;

  const CockpitEarth({
    Key? key,
    this.width = 240,
  }) : super(key: key);

  @override
  State<CockpitEarth> createState() => _CockpitEarthState();
}

class _CockpitEarthState extends State<CockpitEarth> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation01;
  late Animation<double> _animation02;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initAnimation() {
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 8))..repeat();
    _animation01 = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animation02 = Tween<double>(begin: 1, end: 0).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    double factor = widget.width / 240;
    double size = 240 * factor;
    double h2Size = 220 * factor;
    double circleSize = ((100 - 2) * 2) * factor;
    double circleWidth = 7 * factor;
    double gap = 8 * factor;
    double earthSize = circleSize - circleWidth * 2 - gap * 2;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        RotationTransition(
          turns: _animation01,
          child: imageWidget(BEAssetsRes.COCKPIT_EARTH_SHADOW, size),
        ),
        RotationTransition(
          turns: _animation02,
          child: imageWidget(BEAssetsRes.COCKPIT_EARTH_CIRCLE, h2Size),
        ),
        Container(
          width: circleSize,
          height: circleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color.fromRGBO(0, 166, 255, 1),
              width: circleWidth,
            ),
          ),
        ),
        imageWidget(BEAssetsRes.COCKPIT_EARTH, earthSize),
      ],
    );
  }

  Widget imageWidget(String img, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            img,
            package: BEAssetsRes.PACKAGE_NAME,
          ),
          fit: BoxFit.fill,
          opacity: 0.6,
        ),
      ),
    );
  }
}
