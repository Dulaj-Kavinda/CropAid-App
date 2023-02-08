import 'package:flutter/material.dart';

import 'package:cropaid_app/theme/light_colors.dart';

class TopContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final EdgeInsets padding;
  final String imageName;

  TopContainer({
    super.key,
    required this.height,
    required this.width,
    required this.child,
    required this.padding,
    required this.imageName,

  });

  @override
  Widget build(BuildContext context) {


    return Container(
      padding: padding != null
          ? padding
          : const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: const BoxDecoration(
        color: LightColors.kDarkGreen,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40.0),
          bottomLeft: Radius.circular(40.0),
        ),
        image: DecorationImage(
          image: AssetImage('assets/crop_damage.png'),
          fit: BoxFit.cover,
        ),
      ),
      height: height,
      width: width,
      child: child,
    );
  }
}
