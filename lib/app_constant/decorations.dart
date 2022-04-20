import 'package:flutter/material.dart';

class decorations{
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
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
    ),
  );

  static final searchFieldDecoration = BoxDecoration(
      border: Border(
          right: BorderSide(width: 1,color: Colors.black)
      )
  );
}