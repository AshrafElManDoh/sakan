import 'package:flutter/material.dart';
import 'package:sakan/constants.dart';

abstract class AppStyles {
  static TextStyle stylesSemiBold30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: Color(0xff344054)
  );
  static TextStyle stylesSemiBold20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color(0xff344054)
  );
  static TextStyle stylesSemiBold13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Color(0xff344054)
  );
  static TextStyle stylesSemiBold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white
  );
  static TextStyle stylesMedium18=TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500
  );
  static TextStyle stylesBold16=TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    // color: Color(0xff255685)
  );
  static TextStyle stylesRegular12=TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.grey
  );
  static TextStyle stylesRegular16=TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: kthirdColor
  );
}
