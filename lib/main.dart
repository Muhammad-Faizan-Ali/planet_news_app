import 'package:flutter/material.dart';
import 'package:planet_news/app_constant/string_const.dart';
import 'package:planet_news/view_model/forgot_password_view_model.dart';
import 'package:planet_news/view_model/signin_view_model.dart';
import 'package:planet_news/views/bottom_bar.dart';
import 'package:planet_news/views/contact_us_screen.dart';
import 'package:planet_news/views/news_home_page_screen.dart';
import 'package:planet_news/views/otp_screen.dart';
import 'package:planet_news/views/search_email_screen.dart';
import 'package:planet_news/views/signin_screen.dart';
import 'package:planet_news/views/signup_screen.dart';
import 'package:planet_news/views/splash_screen.dart';
import 'package:provider/provider.dart';
import 'views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SigninViewModel>(
          create: (context) {
            return SigninViewModel();
          },
        ),
        ChangeNotifierProvider<ForgotPasswordViewModel>(
          create: (context) {
            return ForgotPasswordViewModel();
          },
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: StringConst.app_name,
          debugShowCheckedModeBanner: false,
          //initialRoute: SplashScreen.id,
          initialRoute: SplashScreen.id,
          routes: {
            SplashScreen.id: (context) => SplashScreen(),
            SignInScreen.id: (context) => SignInScreen(),
            SignupScreen.id: (context) => SignupScreen(),
            OptContainer.id: (context) => OptContainer(),
            HomePageScreen.id: (context) => HomePageScreen(),
            SearchEmail.id: (context) => SearchEmail(),
            News_updates.id: (context) => News_updates(),
            Contact.id: (context) => Contact(),
            BottomBar.id: (context) => BottomBar(),
          },
        );
      },
    );
  }

// MaterialApp(
// title: StringConst.app_name,
// debugShowCheckedModeBanner: false,
// //initialRoute: SplashScreen.id,
// initialRoute: SplashScreen.id,
// routes: {
// SplashScreen.id:   (context) => SplashScreen(),
// SignInScreen.id:   (context) => SignInScreen(),
// SignupScreen.id:   (context) => SignupScreen(),
// OptContainer.id:   (context) => OptContainer(),
// HomePageScreen.id: (context) => HomePageScreen(),
// SearchEmail.id :   (context) => SearchEmail(),
// News_updates.id :  (context) => News_updates(),
// Contact.id :       (context) => Contact(),
// BottomBar.id :     (context) => BottomBar(),
// },
//
// );

}
