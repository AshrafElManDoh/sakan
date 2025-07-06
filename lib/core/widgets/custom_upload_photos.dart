import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/core/widgets/custom_profile_button.dart';

class CustomUploadPhotos extends StatelessWidget {
  const CustomUploadPhotos({
    super.key,
    required this.title,
    required this.images,
    required this.onTap,
  });

  final String title;
  final List<XFile>? images;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // العنوان وزرار الإضافة
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppStyles.stylesMedium18),
            CustomProfileButton(
              title: "Add Photos",
              color: ksecondaryColor,
              onTap: onTap,
            ),
          ],
        ),

        const SizedBox(height: 6),

        // عرض الصور
        Container(
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: images == null || images!.isEmpty
                ? const Center(child: Text("There is no photos!"))
                : ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: images!.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(images![index].path),
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                  ),
          ),
        ),
      ],
    );
  }
}
