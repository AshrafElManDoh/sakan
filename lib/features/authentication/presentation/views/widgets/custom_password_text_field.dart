import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({super.key, required this.name});
  final String name;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool isobscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: TextStyle(
            color: kcolorOfTextField,
            fontSize: 12,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        TextFormField(
          obscureText: isobscure,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                isobscure = !isobscure;
                setState(() {});
              },
              icon: isobscure
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off),
            ),
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
