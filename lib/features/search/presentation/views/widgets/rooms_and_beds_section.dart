import 'package:flutter/material.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/search/presentation/views/widgets/rooms_and_beds_item.dart';

class RoomsAndBedsSection extends StatelessWidget {
  const RoomsAndBedsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rooms and beds",
          style: AppStyles.stylesSemiBold20,
        ),
        SizedBox(
          height: 16,
        ),
        RoomsAndBedsItem(title: "Bedrooms"),
        SizedBox(
          height: 16,
        ),
        RoomsAndBedsItem(title: "Bathrooms"),
        SizedBox(
          height: 16,
        ),
        RoomsAndBedsItem(title: "Beds"),
      ],
    );
  }
}
