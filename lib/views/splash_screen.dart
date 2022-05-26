import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'package:planet_news/singleton/singletonConsts.dart';
import 'package:planet_news/view_model/signin_view_model.dart';
import 'package:planet_news/views/signin_screen.dart';
import 'package:planet_news/widgets/full_screen_loader.dart';
import 'package:provider/provider.dart';
import 'package:planet_news/views/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view_model/categoryListViewModel.dart';
import '../view_model/countriesList_view_model.dart';
import '../view_model/userProfileViewModel.dart';
import 'bottom_bar.dart';
import 'home_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

String finalEmail = '';

class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState




    getValidationData().whenComplete(() async {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Provider.of<CategoryListViewModel>(context,listen: false).getNewsCategories(Singleton.UserID);
      });

      Navigator.pushReplacement(context,    PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 300),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
              Widget child) {
            animation = CurvedAnimation(parent: animation, curve: Curves.easeInOutQuad);
            return FadeTransition(opacity: animation, child: child);
          },
          pageBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation) {
            return finalEmail == "" ? SignInScreen() : BottomBar();
          }
      )
      );

      Navigator.pushReplacementNamed(
          context, finalEmail == "" ? SignInScreen.id : BottomBar.id);
    });

    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString("Emailkey");
    setState(() {
      Singleton.userEmail = finalEmail = obtainedEmail!;
    });
    print(finalEmail);
  }


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
        Expanded(
          child: Container(
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
          flex: 4,
        )
      ],
    ));
  }
}
