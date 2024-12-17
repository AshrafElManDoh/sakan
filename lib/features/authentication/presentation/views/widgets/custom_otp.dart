import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sakan/constants.dart';

class CustomOtp extends StatelessWidget {
  const CustomOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: TextStyle(fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: kcolorOfTextField,
        ),
      ),
    );
    return Pinput(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      length: 5,
      defaultPinTheme: primaryPinTheme,
      focusedPinTheme: primaryPinTheme.copyWith(
        decoration: primaryPinTheme.decoration!.copyWith(
          border: Border.all(
            color: Color(
              0xff664FA1,
            ),
            width: 2,
          ),
        ),
      ),
    );
  }
}
