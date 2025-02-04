import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';

class CustomConfirmPassTextField extends StatefulWidget {
  const CustomConfirmPassTextField(
      {super.key, required this.name, required this.textEditingController,  required this.passController});
  final String name;
  final TextEditingController textEditingController;
  final TextEditingController passController;
  
  @override
  State<CustomConfirmPassTextField> createState() =>
      _CustomConfirmPassTextFieldState();
}

class _CustomConfirmPassTextFieldState extends State<CustomConfirmPassTextField> {
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
            if(widget.textEditingController.text != widget.passController.text){
              return 'password and confirm password not match';
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
