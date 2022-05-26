import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'package:planet_news/app_constant/ui_constant.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/singleton/singletonConsts.dart';
import 'package:planet_news/view_model/privacy_policy_view_model.dart';
import 'package:planet_news/view_model/resendOTPViewModel.dart';
import 'package:planet_news/view_model/signin_view_model.dart';
import 'package:planet_news/view_model/signup_view_model.dart';
import 'package:planet_news/views/bottom_bar.dart';
import 'package:planet_news/views/otp_screen.dart';
import 'package:planet_news/views/social_signin_view.dart';
import 'package:planet_news/views/privacyPolicy_view.dart';
import 'package:planet_news/views/search_email_screen.dart';
import 'package:planet_news/views/signup_screen.dart';
import 'package:planet_news/widgets/custom_button.dart';
import 'package:planet_news/widgets/custom_input_field.dart';
import 'package:planet_news/widgets/full_screen_loader.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planet_news/singleton/singletonConsts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home_page.dart';
import 'news_home_page_screen.dart';

class SignInScreen extends StatefulWidget {
  static const String id = 'SignInScreen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();


  String? email;
  String? password;
  String? Useremail;
  String? DisplayName;

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
                      child: TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, SearchEmail.id);
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text("Forgot Password",
                            style: TextStyle(fontSize: 13, fontFamily: "Montserrat", fontWeight: FontWeight.w600),
                          ),
                        ),
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

                      if(email != "" && password !=""){
await Provider.of<SigninViewModel>(context, listen: false).checkLogin("$email", "$password","Normal");
                      // await Provider.of<SigninViewModel>(context,listen: false).setLoginData("$email", "$password");

                      String strMsg = _signinViewModel.getLoginMsg;

                      if(_signinViewModel.getSigninModel.data[0].success=="1" && _signinViewModel.getSigninModel.data[0].confirmed=="1")
                      {
                        sharedPreferences.setString("userPass", password!);
                        showSnackBar(context: context, message: strMsg, mColor: Colors.grey);
                        print(_signinViewModel.getSigninModel.data[0].name);
                        Singleton.UserID = _signinViewModel.getSigninModel.data[0].userId;
                        Singleton.UserName = _signinViewModel.getSigninModel.data[0].name;
                        Singleton.userPassword = password!;
                        print("Username :: "+Singleton.UserName);

                        print(Singleton.UserID);
                        // await Provider.of<SigninViewModel>(context,listen: false).setLoginData("$email");
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
                              return BottomBar();
                            }
                        )
                        );
                      }

                        else if(_signinViewModel.getSigninModel.data[0].success=="1" && _signinViewModel.getSigninModel.data[0].confirmed=="0"){
                          Fluttertoast.showToast(msg: "Please Confirm your email");
                          Navigator.pushNamed(context,OptContainer.id);
                          showSnackBar(context: context, message: strMsg, mColor: Colors.grey);
                          
                          await Provider.of<ResendOTPViewModel>(context,listen: false).getResendOTP(email.toString());
                          print("Please Confirm your email");
                        }
                        else{
                          Fluttertoast.showToast(msg: "Unexpected Error! Please Try Again");

                        }
                      // showSnackBar(context: context, message: _signinViewModel.getSigninModel.data[0].name, mColor: Colors.grey);

                      }
                      else{
                        Fluttertoast.showToast(msg: "Please Fill out All the fields");
                      }

                      


                      // Navigator.pushNamed(context, HomePageScreen.id);
                    }, btnText: "LOGIN"),
                    SizedBox(height: 15,),
                    Text("or Login with", style: TextStyle(fontSize: 16, fontFamily: "Montserrat", fontWeight: FontWeight.w700),),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        SocialButton(logoPath: "assets/fb_logo.png", onPressed: () async{
                          await Provider.of<SignupViewModel>(context,listen: false).FacebookSignIn();
                          Navigator.push(context,PageRouteBuilder(
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
                                  return BottomBar();
                                  // return SocialSignInView(loginType: "Facebook",);
                                }
                              )
                            );
                          }
                        ),

                      
                        SocialButton(
                          logoPath: "assets/gmail_logo.png",
                           onPressed: ()async{
                            var googleUser = await GoogleSignIn().signIn();
                            print(googleUser!.displayName);
                            print(googleUser.email);
                            setState(() {
                              Singleton.SocialEmail = Useremail = googleUser.email;
                              DisplayName=googleUser.displayName;
                              Singleton.SocialAuthID = googleUser.id;
                              print(Singleton.SocialAuthID);
                            });

                            print(googleUser.id);
                            Navigator.push(context,PageRouteBuilder(
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
                                  return SocialSignInView(loginType: "Google",);
                                }
                            )
                            );
                            },
                          ),


                        // OutlinedButton(
                        //   onPressed: ()async{
                        //     var googleUser = await GoogleSignIn().signIn();
                        //     print(googleUser!.displayName);
                        //     print(googleUser.email);
                        //     setState(() {
                        //       Singleton.SocialEmail = Useremail = googleUser.email;
                        //       DisplayName=googleUser.displayName;
                        //       Singleton.SocialAuthID = googleUser.id;
                        //       print(Singleton.SocialAuthID);
                        //     });

                        //     print(googleUser.id);
                        //     Navigator.push(context,PageRouteBuilder(
                        //         transitionDuration: Duration(milliseconds: 300),
                        //         transitionsBuilder: (BuildContext context,
                        //             Animation<double> animation,
                        //             Animation<double> secAnimation,
                        //             Widget child) {
                        //           animation = CurvedAnimation(parent: animation, curve: Curves.easeInOutQuad);
                        //           return FadeTransition(opacity: animation, child: child);
                        //         },
                        //         pageBuilder: (BuildContext context,
                        //             Animation<double> animation,
                        //             Animation<double> secAnimation) {
                        //           return GoogleSignInView();
                        //         }
                        //     )
                        //     );
                        //   },
                        //   child: Container(
                        //     height: 40,
                        //     child: Image.asset("assets/gmail_logo.png"),
                        //   ),
                        // ),
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

                  Navigator.push(context,    PageRouteBuilder(
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
                        return SignupScreen();
                      }
                  )
                  );
                }, btnText: "SIGN UP"),
              ),

            ],
          ),
        )
    );
  }
}
