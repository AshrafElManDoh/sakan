import 'package:flutter/material.dart';
import 'package:sakan/core/utils/app_styles.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton(
      {super.key, required this.title, required this.color, this.onTap});
  final String title;
  final Color color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
