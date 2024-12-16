import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/assets.dart';

class CustomLogoandName extends StatelessWidget {
  const CustomLogoandName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: kPrimaryColor,
          radius: 38,
          child: Image.asset(
            Assets.logo,
            height: 37,
          ),
        ),
        SizedBox(
          width: 13,
        ),
        Text(
          "Sakan",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 33,
          ),
        )
      ],
    );
  }
}
