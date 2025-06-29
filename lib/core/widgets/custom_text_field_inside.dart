import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';

class CustomTextFieldInside extends StatelessWidget {
  const CustomTextFieldInside({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(title, style: AppStyles.stylesMedium18),
        ),
        SizedBox(
          height: 6,
        ),
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: kcolorOfTextField),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: kcolorOfTextField),
            ),
          ),
        ),
      ],
    );
  }
}
