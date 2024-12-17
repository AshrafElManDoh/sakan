import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakan/core/utils/app_router.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_button.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_logo_and_name.dart';
import 'package:sakan/features/authentication/presentation/views/widgets/custom_otp.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

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
              "Write code",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 16,
            ),
            CustomOtp(),
            SizedBox(
              height: 16,
            ),
            CustomUnderlinedText(),
            SizedBox(
              height: 42,
            ),
            CustomButton(name: "Confirm",onTap: () {
              GoRouter.of(context).pushReplacement(AppRouter.resetPasswordView);
            },),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomUnderlinedText extends StatelessWidget {
  const CustomUnderlinedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ),
        child: Text(
          'Resend code',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
