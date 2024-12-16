import 'package:flutter/material.dart';

class CustomSocial extends StatelessWidget {
  const CustomSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            "assets/icon/facebook.png",
            width: 32,
          ),
        ),
        SizedBox(
          width: 24,
        ),
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            "assets/icon/apple.png",
            width: 32,
          ),
        ),
        SizedBox(
          width: 24,
        ),
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            "assets/icon/google.png",
            width: 32,
          ),
        ),
      ],
    );
  }
}
