import 'package:flutter/material.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_button.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_logo_and_name.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_password_text_field.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomLogoandName(),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Reset password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 16,
            ),
            CustomPasswordTextField(name: "Enter Password"),
            SizedBox(
              height: 16,
            ),
            CustomPasswordTextField(name: "Confirm Password"),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 42,
            ),
            CustomButton(name: "Sign up"),
            SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}
