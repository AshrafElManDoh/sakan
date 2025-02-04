import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField(
      {super.key,
      required this.name,
      required this.textEditingController,
      required this.isLogin});
  final String name;
  final TextEditingController textEditingController;
  final bool isLogin;
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
          controller: widget.textEditingController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (!widget.isLogin) {
              if (value!.length < 6) {
                return "Password is too short !";
              }
            }
            if (value!.isEmpty) {
              return "Password must not be empty";
            }
            return null;
          },
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
