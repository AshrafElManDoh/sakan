import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';

class CustomDropDownFormField extends StatefulWidget {
  const CustomDropDownFormField({super.key});

  @override
  State<CustomDropDownFormField> createState() =>
      _CustomDropDownFormFieldState();
}

class _CustomDropDownFormFieldState extends State<CustomDropDownFormField> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: AppStyles.stylesSemiBold20,
        ),
        SizedBox(
          height: 16,
        ),
        DropdownButtonFormField<String>(
          value: selectedValue,
          items: [
            DropdownMenuItem(
              child: Text("Male"),
              value: "Male",
            ),
            DropdownMenuItem(
              child: Text("Female"),
              value: "Female",
            ),
          ],
          onChanged: (newValue) {
            selectedValue = newValue;
          },
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
