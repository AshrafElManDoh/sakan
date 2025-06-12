import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/core/widgets/custom_profile_button.dart';
import 'package:sakan/core/widgets/custom_text_field_inside.dart';
import 'package:sakan/core/widgets/custom_upload_photos.dart';

class AddApartmentBody extends StatelessWidget {
  const AddApartmentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Apartment",
              style:
                  AppStyles.stylesSemiBold30.copyWith(color: ksecondaryColor),
            ),
            SizedBox(
              height: 32,
            ),
            CustomTextFieldInside(title: "Apartment Title"),
            SizedBox(
              height: 16,
            ),
            CustomTextFieldInside(title: "Address"),
            SizedBox(
              height: 16,
            ),
            CustomTextFieldInside(title: "Size"),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextFieldInside(title: "number of rooms"),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CustomTextFieldInside(title: "number of bathrooms"),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            CustomUploadPhotos(title: "Upload Apartment Photos"),
            SizedBox(
              height: 16,
            ),
            Align(
              child: CustomProfileButton(
                  title: "Add Apartment", color: ksecondaryColor),
            ),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
