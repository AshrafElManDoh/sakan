import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/core/widgets/custom_profile_button.dart';

class CustomUserInfo extends StatefulWidget {
  const CustomUserInfo({super.key});

  @override
  State<CustomUserInfo> createState() => _CustomUserInfoState();
}

class _CustomUserInfoState extends State<CustomUserInfo> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(
        () {
          _imageFile = File(pickedImage.path);
        },
      );
    } else {
      print("there is not a picture");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: _imageFile != null
                ? FileImage(_imageFile!)
                : AssetImage("assets/icon/Oval.png"),
          ),
          Column(
            children: [
              Text(
                "Anna Karlsson",
                style: AppStyles.stylesSemiBold13,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "anna.karlsson@gmail.com",
                style: AppStyles.stylesRegular12.copyWith(
                  color: kthirdColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomProfileButton(
                title: "Upload new picture",
                color: ksecondaryColor,
                onTap: _pickImage,
              )
            ],
          )
        ],
      ),
    );
  }
}
