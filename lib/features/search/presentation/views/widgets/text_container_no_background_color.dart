import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';

class TextContainerNoBackgroundColor extends StatelessWidget {
  const TextContainerNoBackgroundColor(
      {super.key, required this.title, required this.isActive, this.onTap});
  final String title;
  final void Function()? onTap ;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(9),
        decoration: ShapeDecoration(
          shape: OutlineInputBorder(
            borderSide: BorderSide(
              color: isActive?ksecondaryColor: kthirdColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          title,
          style: AppStyles.stylesMedium18.copyWith(
            color: isActive?ksecondaryColor: kthirdColor,
          ),
        ),
      ),
    );
  }
}
