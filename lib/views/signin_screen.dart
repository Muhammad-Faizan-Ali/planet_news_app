import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'package:planet_news/app_constant/ui_constant.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/view_model/signin_view_model.dart';
import 'package:planet_news/views/signup_screen.dart';
import 'package:planet_news/widgets/custom_button.dart';
import 'package:planet_news/widgets/custom_input_field.dart';
import 'package:planet_news/widgets/full_screen_loader.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'home_page.dart';

class SignInScreen extends StatelessWidget {
  static const String id = 'SignInScreen';
  String? email;
  String? password;

  TextEditingController txtLoginEmailController = new TextEditingController();
  TextEditingController txtLoginPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    SigninViewModel _signinViewModel = Provider.of<SigninViewModel>(context);

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
                margin: EdgeInsets.symmetric(horizontal: 40),
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
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text("Forgot Password", style: TextStyle(fontSize: 13, fontFamily: "Montserrat", fontWeight: FontWeight.w600),),
                    ),
                    SizedBox(height: 8,),
                    SimpleButton(onPressed: () async {

                      email = txtLoginEmailController.value.text.toString().trim();
                      password = txtLoginPasswordController.value.text.toString().trim();

                      print(email);
                      print(password);

                      await Provider.of<SigninViewModel>(context, listen: false).checkLogin("$email", "$password");
                      String strMsg = _signinViewModel.getLoginMsg;
                      showSnackBar(context: context, message: strMsg, mColor: Colors.grey);
                      // showSnackBar(context: context, message: _signinViewModel.getSigninModel.data[0].name, mColor: Colors.grey);
                      print(_signinViewModel.getSigninModel.data[0].name);
                      // Navigator.pushNamed(context, HomePageScreen.id);
                    }, btnText: "LOGIN"),
                    SizedBox(height: 15,),
                    Text("or Login with", style: TextStyle(fontSize: 16, fontFamily: "Montserrat", fontWeight: FontWeight.w700),),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40,
                          child: Image.asset("assets/fb_logo.png"),
                        ),
                        Container(
                          height: 40,
                          child: Image.asset("assets/gmail_logo.png"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: SimpleButton(onPressed: () async {
                  
                  // await Provider.of<SigninViewModel>(context, listen: false).checkLogin("user_test@example.com", "123456");
                  
                  // Navigator.pushNamed(context, SignupScreen.id);
                }, btnText: "SIGN UP"),
              )
            ],
          ),
        )
    );
  }
}
