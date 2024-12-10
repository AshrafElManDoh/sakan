import 'package:flutter/material.dart';

class CustomConatinerForUser extends StatelessWidget {
  const CustomConatinerForUser(
      {super.key, required this.icon, required this.userName});
  final IconData icon;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0,
            blurRadius: 2,
            // offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Color(0xff255685),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
