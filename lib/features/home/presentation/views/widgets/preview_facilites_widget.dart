import 'package:flutter/material.dart';
import 'package:sakan/core/utils/app_styles.dart';

class PreviewFacilitesWidget extends StatelessWidget {
  const PreviewFacilitesWidget({super.key});

  static const List<String> facilities = [
    "Shared Living Room",
    "Balcony",
    "WiFi",
    "Heating",
    "Washing Machine",
    "Air Conditioner"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Facilities",
          style: AppStyles.stylesSemiBold13,
        ),
        SizedBox(
          height: 8,
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: facilities.map(
            (e) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  e,
                  style: AppStyles.stylesRegular12
                      .copyWith(color: Color(0xff344054)),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
