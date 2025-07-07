import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';

class DropDownApartments extends StatelessWidget {
  const DropDownApartments(
      {super.key, required this.apartments, this.value, this.onChanged});
  final List<ApartmentModel> apartments;
  final int? value;
  final void Function(int?)? onChanged;

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
        DropdownButtonFormField<int>(
          value: value,
          items: List.generate(
            apartments.length,
            (index) {
              return DropdownMenuItem(
                child: Text(apartments[index].titledto!),
                value: apartments[index].id,
              );
            },
          ),
          onChanged: onChanged,
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
