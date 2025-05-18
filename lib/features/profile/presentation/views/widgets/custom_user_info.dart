import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';
import 'package:sakan/core/utils/app_styles.dart';
import 'package:sakan/core/widgets/custom_profile_button.dart';

class CustomUserInfo extends StatelessWidget {
  const CustomUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/icon/Oval.png"),
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
              )
            ],
          )
        ],
      ),
    );
  }
}
