import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.name,
    required this.isEmail,
    required this.textEditingController,
  });
  final String name;
  final bool isEmail;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            color: kcolorOfTextField,
            fontSize: 12,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        TextFormField(
          controller: textEditingController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (isEmail) {
              final bool emailValid =
                  RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}')
                      .hasMatch(value!);
              if (value.isEmpty) {
                return "E-mail must not be empty";
              }
              if (emailValid == false) {
                return "Invalid email format!";
              }
            }
            return null;
          },
          decoration: InputDecoration(
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
      ],
    );
  }
}
