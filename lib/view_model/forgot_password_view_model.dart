import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:planet_news/helper/api_helper.dart';
import 'package:planet_news/exceptions/app_exceptions.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/model/forgotPassword_model.dart';
import 'package:provider/provider.dart';

class ForgotPasswordViewModel with ChangeNotifier{
  static const String method_name = "forgot_pass";

  String forgotMsg = '';
  AppStatus _appStatus = AppStatus.IDLE;
  late ForgotPasswordModel forgotPasswordModel;

  set setAppStatus(AppStatus newAppStatus){
    _appStatus = newAppStatus;
    notifyListeners();
  }

  AppStatus get getAppStatus => _appStatus;

  set setforgotMsg(String newMsg)
  {
    forgotMsg = newMsg;
    notifyListeners();
  }

  String get getForgotMsg => forgotMsg;

  set setForgotPasswordModel (ForgotPasswordModel newPasswordModel)
  {
    forgotPasswordModel = newPasswordModel;
    notifyListeners();
  }

  ForgotPasswordModel get getForgotPasswordModel => forgotPasswordModel;

  Future<dynamic> forgetPassword(String email, {showLoading = true}) async{
    if(showLoading){
      setAppStatus = AppStatus.LOADING;
    }

    Map<String,dynamic> _body = {
      "method_name": method_name,
      "email": email,
    };

    try{
      dynamic ApiResponse = await ApiBaseHelper().post(body: _body);

      ForgotPasswordModel forgotModel = new ForgotPasswordModel.fromJson(ApiResponse);

      print(forgotModel.data[0].msg);


      if(forgotModel.data[0].success == '1'){
        setForgotPasswordModel = forgotModel;
        setforgotMsg = forgotModel.data[0].msg;
        print("Password Found");
      }
      else{
        setforgotMsg = forgotModel.data[0].msg;
        print("Failed");
      }
      setAppStatus = AppStatus.IDLE;



    } on Exception catch(e)
    {
      setAppStatus = AppStatus.ERROR;
      setforgotMsg = e.toString();
      print(e.toString());
    }
  }


}
