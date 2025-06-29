import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/assets.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key, required this.radius});
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: kPrimaryColor,
      radius: radius,
      child: Image.asset(
        Assets.logo,
        height: radius,
      ),
    );
  }
}
