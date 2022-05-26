import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'package:planet_news/app_constant/country_list.dart';
import 'package:planet_news/app_constant/string_const.dart';
import 'package:planet_news/app_constant/ui_constant.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/model/countries_list_model.dart';
import 'package:planet_news/singleton/singletonConsts.dart';
import 'package:planet_news/view_model/countriesList_view_model.dart';
import 'package:planet_news/views/search_email_screen.dart';
import 'package:planet_news/views/signin_screen.dart';
import 'package:planet_news/views/signup_screen.dart';
import 'package:planet_news/widgets/custom_button.dart';
import 'package:planet_news/widgets/custom_input_field.dart';
import 'package:country_picker/country_picker.dart';
import 'package:planet_news/view_model/signup_view_model.dart';
import 'package:planet_news/widgets/full_screen_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view_model/signin_view_model.dart';
import 'bottom_bar.dart';
import 'home_page.dart';
import 'otp_screen.dart';
import 'package:provider/provider.dart';


class SocialSignInView extends StatefulWidget {
  
  
  SocialSignInView({required this.loginType});
  String loginType;

  static const String id = 'GoogleSignIn';

  @override
  _SocialSignInViewState createState() => _SocialSignInViewState();
}

class _SocialSignInViewState extends State<SocialSignInView> {
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    SigninViewModel _signinViewModel = Provider.of<SigninViewModel>(context,listen: false);
    TextEditingController txtLoginEmailController = new TextEditingController(
      text: Singleton.SocialEmail,
    );
    TextEditingController txtLoginPasswordController = new TextEditingController();

    return Scaffold(
        backgroundColor: ColorConst.screen_bg,
        body: (_signinViewModel.getAppStatus == AppStatus.LOADING) ? FullScreenLoader() : SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 280,
                alignment: Alignment.center,
                child: Image.asset("assets/app_logo.png"),
              ),
              Container(
                width: double.infinity,
                // height: 380,
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.symmetric(horizontal: 27),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 5, offset: Offset(0, 2)),
                  ],
                ),
                child: Column(
                  children: [
                    SimpleInputField(
                      labelText: "Enter Your Email",
                      secureText: false,
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                      txtController: txtLoginEmailController,
                      onChanged: (value){
                        // email = txtLoginEmailController.text;
                        // print(email);
                      },
                    ),
                    SizedBox(height: 20,),
                    SimpleInputField(
                      labelText: "Password",
                      secureText: true,
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                      txtController: txtLoginPasswordController,
                      onChanged: (value){
                        // password = value;
                        // print(password);
                      },
                    ),
                    SizedBox(height: 8,),
                    GestureDetector(
                      onTap: ()
                      {
                        Navigator.pushNamed(context, SearchEmail.id);
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text("Forgot Password", style: TextStyle(fontSize: 13, fontFamily: "Montserrat", fontWeight: FontWeight.w600),),
                      ),
                    ),
                    SizedBox(height: 8,),
                    SimpleButton(onPressed: () async {
                      
                      final SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                      email = txtLoginEmailController.value.text.toString().trim();
                      password = txtLoginPasswordController.value.text.toString().trim();

                      print(email);
                      print(password);
                      await _signinViewModel.checkLogin(email!, password!, widget.loginType);

                      if(_signinViewModel.getSigninModel.data[0].success == "1")
                        {
                          Fluttertoast.showToast(msg: "Login Successfull");
                          Navigator.pushReplacementNamed(context, BottomBar.id);
                        }
                    }, btnText: "LOGIN"),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: SimpleButton(onPressed: () async {
                  // await Provider.of<SigninViewModel>(context, listen: false).checkLogin("user_test@example.com", "123456");
                  Navigator.pushNamed(context, SignupScreen.id);
                }, btnText: "SIGN UP"),
              ),
            ],
          ),
        )
    );
  }
}

