import 'package:flutter/material.dart';
import 'package:sakan/core/utils/app_styles.dart';

class CustomChooseText extends StatelessWidget {
  const CustomChooseText({
    super.key, required this.text,
  });
  final String text ;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Choose Your Destination City",
      style: AppStyles.stylesSemiBold30,
    );
  }
}