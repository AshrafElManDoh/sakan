import 'package:flutter/material.dart';
import 'package:sakan/core/utils/app_styles.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key, required this.description_text});
  final String description_text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: AppStyles.stylesSemiBold13,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          description_text,
          style: AppStyles.stylesRegular12,
        )
      ],
    );
  }
}
