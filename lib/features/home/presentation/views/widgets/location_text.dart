import 'package:flutter/material.dart';
import 'package:sakan/core/utils/app_styles.dart';

class LocationText extends StatelessWidget {
  const LocationText({super.key, required this.locationAddress,  this.alignment});
  final String locationAddress;
  final MainAxisAlignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment ?? MainAxisAlignment.center,
      children: [
        Icon(
          Icons.location_on,
          size: 14,
          color: Colors.grey,
        ),
        Text(
          locationAddress,
          style: AppStyles.stylesRegular12,
        ),
      ],
    );
  }
}
