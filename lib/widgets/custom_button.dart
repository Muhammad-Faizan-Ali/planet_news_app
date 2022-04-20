import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planet_news/app_constant/color_const.dart';

class SimpleButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String btnText;

  SimpleButton({required this.onPressed, required this.btnText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(btnText),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(ColorConst.btn_bg),
          minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity,
              50),),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              )
          )
      ),
    );
  }
}


class SearchButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String btnText;

  SearchButton({required this.onPressed, required this.btnText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(btnText),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(ColorConst.btn_bg),
          minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity,
              50),),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )
          )
      ),
    );
  }
}

