import 'package:flutter/material.dart';
import 'package:sakan/core/utils/app_styles.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton({super.key, required this.title, required this.color});
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: AppStyles.stylesSemiBold13.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
