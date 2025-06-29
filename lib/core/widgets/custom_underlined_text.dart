import 'package:flutter/material.dart';

class CustomUnderlinedText extends StatelessWidget {
  const CustomUnderlinedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
