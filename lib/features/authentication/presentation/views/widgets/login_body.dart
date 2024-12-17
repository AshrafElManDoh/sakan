import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_break_line.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_button.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_logo_and_name.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_social.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_text_field.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextField(name: "Enter Email"),
            SizedBox(
              height: 16,
            ),CustomTextField(name: "Enter Password"),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  'Forget password?',
                  style: TextStyle(
                      color: Color(0xff4F545A), fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.forgetPasswordView);
                  },
                  child: Text(
                    "Click here",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 42,),
            CustomButton(name: "Login"),
            SizedBox(height: 24,),
            CustomBreakLine(),
            SizedBox(height: 36,),
            CustomSocial(),
            SizedBox(height: 70,)
          ],
        ),
      ),
    );
  }
}