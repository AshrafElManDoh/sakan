import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';

class DropDownApartments extends StatefulWidget {
  const DropDownApartments({super.key});

  @override
  State<DropDownApartments> createState() => _DropDownApartmentsState();
}

class _DropDownApartmentsState extends State<DropDownApartments> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Apartment",
          style: AppStyles.stylesMedium18,
        ),
        SizedBox(
          height: 16,
        ),
        DropdownButtonFormField<String>(
          value: selectedValue,
          items: [
            DropdownMenuItem(
              child: Text("Casa da Alegria"),
              value: "Casa da Alegria",
            ),
            DropdownMenuItem(
              child: Text("Casa Monteiro II"),
              value: "Casa Monteiro II",
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
