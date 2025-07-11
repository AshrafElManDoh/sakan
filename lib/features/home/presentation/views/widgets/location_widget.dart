import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/features/home/presentation/views/widgets/location_text.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget(
      {super.key,
      required this.location,
      required this.latitude,
      required this.longitude});
  final String location;
  final double latitude, longitude;

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
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.asset("assets/icon/1 (County).png"),
            ElevatedButton(
              onPressed: () {
                context.go(
                  AppRouter.mapView,
                  extra: {
                    'latitude': latitude,
                    'longitude': longitude,
                  },
                );
              },
              child: Text("Go to apartment location"),
            ),
          ],
        ),
      ],
    );
  }
}
