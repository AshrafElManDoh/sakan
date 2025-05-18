import 'package:flutter/material.dart';
import 'package:sakan/core/widgets/custom_profile_button.dart';
import 'package:sakan/features/home/presentation/views/widgets/custom_choose_text.dart';
import 'package:sakan/features/profile/presentation/views/widgets/custom_drop_down_form_field.dart';
import 'package:sakan/features/profile/presentation/views/widgets/custom_profile_text_field.dart';
import 'package:sakan/features/profile/presentation/views/widgets/custom_user_info.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            CustomUserInfo(),
            SizedBox(
              height: 32,
            ),
            CustomChooseText(text: "Basic Info"),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomProfileTextField(title: "First Name"),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomProfileTextField(title: "Last Name"),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            CustomDropDownFormField(),
            SizedBox(
              height: 16,
            ),
            CustomProfileTextField(title: "Email"),
            SizedBox(
              height: 16,
            ),
            CustomProfileTextField(title: "Phone Number"),
            SizedBox(
              height: 16,
            ),
            CustomProfileTextField(title: "University"),
            SizedBox(
              height: 16,
            ),
            CustomProfileTextField(title: "College"),
            SizedBox(
              height: 32,
            ),
            // CustomChooseText(text: "Additional Details"),
            Align(
              child: CustomProfileButton(
                title: "Delete Account",
                color: Color(0xffAA2117),
              ),
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
