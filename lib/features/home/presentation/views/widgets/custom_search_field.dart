import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28,),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search for other cities",
          filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: kcolorOfTextField),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: kcolorOfTextField),
    ),
        ),
      ),
    );
  }
}
