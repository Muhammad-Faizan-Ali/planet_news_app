import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  Color mColor = Colors.red,
  int duration = 3200,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: duration),
      backgroundColor: mColor,
    ),);
  }