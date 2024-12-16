import 'package:flutter/material.dart';

class CustomBreakLine extends StatelessWidget {
  const CustomBreakLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: Colors.black,
            thickness: 1,
            endIndent: 10,
          ),
        ),
        Text('Or'),
        Expanded(
          child: Divider(
            color: Colors.black,
            thickness: 1,
            indent: 10,
          ),
        ),
      ],
    );
  }
}
