import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/core/widgets/custom_profile_button.dart';

class CustomUploadPhotos extends StatelessWidget {
  const CustomUploadPhotos({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppStyles.stylesMedium18,
            ),
            CustomProfileButton(title: "Add Photos", color: ksecondaryColor)
          ],
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                "No photos yet!",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
