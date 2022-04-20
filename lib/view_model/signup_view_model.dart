import 'package:flutter/cupertino.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/helper/api_helper.dart';
import 'package:planet_news/model/signin_model.dart';
import 'package:flutter/material.dart';
import 'package:planet_news/model/signup_model.dart';

class SignupViewModel with ChangeNotifier{
  static const String MethodName = "user_register";
  static const String type = "Normal";

  String registerMsg = '';

  AppStatus _appStatus = AppStatus.IDLE;

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


  late SignupViewModel _signupModel = new SignupViewModel();

  set setSignupModel(SignupViewModel newSignUpModel)
  {
    _signupModel = newSignUpModel;
    notifyListeners();
  }

  SignupViewModel get getSignUpModel => _signupModel;
  Future<dynamic> registerUser(String name,String email, String password,{showLoading = true,String PhNumber = "1234567"})async
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
        "phone": PhNumber,
        "type": type,
        "auth_id": ""
    };

    try{
      dynamic API_Response = await ApiBaseHelper().post(body: _body);
      SignupModel _signupModel = new SignupModel.fromJson(API_Response);
      print(_signupModel.data[0].msg);



    }on Exception catch(e){
      print(e.toString());
    }





  }
  // Future<dynamic> registerUser()







}