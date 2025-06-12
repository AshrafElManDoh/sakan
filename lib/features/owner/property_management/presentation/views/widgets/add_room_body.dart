import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/core/widgets/custom_description_field.dart';
import 'package:sakan/core/widgets/custom_profile_button.dart';
import 'package:sakan/core/widgets/custom_text_field_inside.dart';
import 'package:sakan/core/widgets/custom_upload_photos.dart';
import 'package:sakan/features/owner/property_management/presentation/views/widgets/drop_down_apartments.dart';

class AddRoomBody extends StatelessWidget {
  const AddRoomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Room",
              style:
                  AppStyles.stylesSemiBold30.copyWith(color: ksecondaryColor),
            ),
            SizedBox(
              height: 32,
            ),
            CustomTextFieldInside(title: "Property Title"),
            SizedBox(
              height: 16,
            ),
            CustomTextFieldInside(title: "Number of beds"),
            SizedBox(
              height: 16,
            ),
            CustomTextFieldInside(title: "Size"),
            SizedBox(
              height: 16,
            ),DropDownApartments(),SizedBox(height: 16,),
            CustomDescriptionField(title: "Description"),
            SizedBox(
              height: 16,
            ),
            CustomUploadPhotos(title: "Upload Apartment Photos"),
            SizedBox(height: 16,),
            CustomTextFieldInside(title: r"Price\per month for this room"),
            SizedBox(height: 16,),
            CustomTextFieldInside(title: r"Price\per month for each bed"),
            SizedBox(
              height: 16,
            ),
            Align(child: CustomProfileButton(title: "Add Room", color: ksecondaryColor)),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
