import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'package:planet_news/views/signin_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String id = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: ColorConst.wgt_bg,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              "WELCOME \n TO",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontFamily: "Montserrat"),
            ),
          ),
          flex: 2,
        ),
        Expanded(child: Container(
          width: double.infinity,
          height: 400,
          alignment: Alignment.center,
          // margin: EdgeInsets.only(bottom: 50),
          child: AnimatedSplashScreen(
            nextScreen: SignInScreen(),
            duration: 8 * Duration.millisecondsPerSecond,
            centered: true,
            backgroundColor: Colors.transparent,
            animationDuration: Duration(milliseconds: 10),
            splash: Image.asset("assets/app_logo.png"),
            splashIconSize: 360,
          ),
        ),
        flex: 4,)
      ],
    ));
  }
}
