import 'package:flutter/material.dart';
class StringConst {
  static const String app_name = "Planet News";


  static final textFieldContainerDec = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(40),
    boxShadow: [
      BoxShadow(
          color: Colors.grey, blurRadius: 5, offset: Offset(0, 2)),
    ],
  );



  static final otpFormDecoraton = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    contentPadding:
    EdgeInsets.symmetric(horizontal: 10,),
    border: OutlineInputBorder(

      borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    ),
    focusedBorder: OutlineInputBorder(

      borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    ),
    enabledBorder: OutlineInputBorder(

      borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    ),
  );

}