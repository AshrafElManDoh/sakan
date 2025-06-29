import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';

class CustomDescriptionField extends StatelessWidget {
  const CustomDescriptionField({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.stylesMedium18),
        SizedBox(
          height: 6,
        ),
        TextFormField(
          maxLines: 6,
          decoration: InputDecoration(
            hintText: "Enter a description...",
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
