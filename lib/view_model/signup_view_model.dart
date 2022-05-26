import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/helper/api_helper.dart';
import 'package:planet_news/model/signin_model.dart';
import 'package:flutter/material.dart';
import 'package:planet_news/model/signup_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:planet_news/singleton/singletonConsts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupViewModel with ChangeNotifier{
  static const String MethodName = "user_register";
  // static const String type = "Normal";

  String registerMsg = '';
  AppStatus _appStatus = AppStatus.IDLE;

  AccessToken? _accessToken;
  Map<String, dynamic>? userData;

  set setAppStatus (AppStatus newAppStatus) {
    _appStatus = newAppStatus;
    notifyListeners();
  }
  AppStatus get getAppStatus => _appStatus;

  set setRegisterMsg(String newRegisterMsg)
  {
    registerMsg = newRegisterMsg;
    notifyListeners();
  }
  String get getRegisterMsg => registerMsg;


  late SignupModel _signupModel;

  set setSignupModel(SignupModel newSignUpModel)
  {
    _signupModel = newSignUpModel;
    notifyListeners();
  }

  SignupModel get getSignUpModel => _signupModel;
  GoogleSignIn _googleSignIn = GoogleSignIn();


  Future googleSignIn()async{
    try{
      await _googleSignIn.signIn();
    }on Exception catch(e)
    {
      print(e.toString());
    }
  }


  Future FacebookSignIn()async
  {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if(loginResult.status == LoginStatus.success)
      {
        SharedPreferences LoginSharePref = await SharedPreferences.getInstance();
        _accessToken = loginResult.accessToken;
        print("UID: ");
        print(_accessToken?.userId);

        final _userData = await FacebookAuth.instance.getUserData();
        userData = _userData;

        Singleton.SocialEmail = userData!['email'];
        Singleton.SocialAuthID = _accessToken?.userId;

        print(userData!['name']);

        LoginSharePref.setString("UserNameKey", userData!['name']);

        print("Email: ${userData!['email']}");

        Fluttertoast.showToast(msg: "Login Successfull");
        // print(_userData![""]);
      }else{
      print(loginResult.status);
      print(loginResult.message);
    }
    // checking = false;
    // setState(() {
      
    // });
  }



  Future<dynamic> registerUser(String name,String email, String password,String phNumber,String gender,String registerType,String authID,String CountryID,{showLoading = true})async
  {
    if(showLoading)
      {
        setAppStatus = AppStatus.LOADING;
      }
    Map<String,dynamic> _body ={

      "method_name": MethodName,
      "name": name,
      "email": email,
      "password": password,
      "phone": phNumber,
      "type": registerType,
      "auth_id": authID,
      "country_id": CountryID,
      "gender": gender,
    };

    try{
      dynamic API_Response = await ApiBaseHelper().post(body: _body);
      SignupModel _signupModel = new SignupModel.fromJson(API_Response);
      print("Message:" + _signupModel.data[0].msg);

      if(_signupModel.data[0].success == "1")
        {
          setSignupModel = _signupModel;
          setRegisterMsg = _signupModel.data[0].msg;
          print("Registered");
        }
      else
        {
          setRegisterMsg = _signupModel.data[0].msg;
        }

      setAppStatus = AppStatus.IDLE;
    }on Exception catch(e){
      print(e.toString());
    }






  }
  // Future<dynamic> registerUser()







}