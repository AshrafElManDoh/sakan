import 'package:flutter/material.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/home/presentation/views/widgets/location_text.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.location});
  final String location ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: AppStyles.stylesSemiBold13,
        ),
        LocationText(
          locationAddress: location,
          alignment: MainAxisAlignment.start,
        ),
        SizedBox(
          height: 16,
        ),
        Image.asset("assets/icon/1 (County).png"),
      ],
    );
  }
}
