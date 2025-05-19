import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';

class CustomImageWithAspectRatio extends StatelessWidget {
  const CustomImageWithAspectRatio({super.key, required this.imagePath, required this.isActive});
  final String imagePath;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 380 / 225,
      child: Container(
        padding: isActive? EdgeInsets.all(4) :EdgeInsets.all(0),
        color: ksecondaryColor,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
