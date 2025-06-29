import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';

class CustomProfileTextField extends StatelessWidget {
  const CustomProfileTextField({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.stylesSemiBold20),
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
