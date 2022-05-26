


import 'package:flutter/cupertino.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/helper/api_helper.dart';
import 'package:planet_news/model/signin_model.dart';
import 'package:planet_news/singleton/singletonConsts.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SigninViewModel with ChangeNotifier {
  static const String method_name = "users_login";
  // static const String type = "Normal";
  String _loginMsg = "";

  AppStatus _appStatus = AppStatus.IDLE;

  List<String>? loginDetails;

  set setAppStatus(AppStatus newStatus) {
    _appStatus = newStatus;
    notifyListeners();
  }

  AppStatus get getAppStatus => _appStatus;


  set setLoginMsg(String newLoginMsg) {
    _loginMsg = newLoginMsg;
    notifyListeners();
  }

  String get getLoginMsg => _loginMsg;

  late SigninModel _signinModel;

  set setSigninModel(SigninModel newSignnModel) {
    _signinModel = newSignnModel;
    notifyListeners();
  }

  SigninModel get getSigninModel => _signinModel;

  Future<void> setLoginData(loginEmail)async{



  }

  
  Future<dynamic> checkLogin(String email, String password,String type, {showLoading = true}) async {
    if(showLoading){
      setAppStatus = AppStatus.LOADING;
    }

    Map<String, dynamic> _body = {
      "method_name": method_name,
      "email": email,
      "password": password,
      "type": type
    };

    try{
      dynamic response = await ApiBaseHelper().post(body: _body);
      SigninModel signinModel = new SigninModel.fromJson(response);

      print(signinModel.data[0].msg);

      setLoginMsg = signinModel.data[0].msg;
      print("Confirmed: "+signinModel.data[0].confirmed);

      if(signinModel.data[0].success == "1") {
        setSigninModel = signinModel;
        setLoginMsg = signinModel.data[0].msg;
        final SharedPreferences  pref = await SharedPreferences.getInstance();
        final result = pref.setString("Emailkey", email);
        final UserName = pref.setString("UserNameKey", signinModel.data[0].name);
        final UserID = pref.setString("UserID", signinModel.data[0].userId);
        // final userName = pref.setString("UserName", value)
        // print(result.);
        Singleton.userEmail = email;
        Singleton.userPassword = password;

        print("Logged In");
      }
      else {
        setLoginMsg = signinModel.data[0].msg;
        print("Failed");
      }
      setAppStatus = AppStatus.IDLE;

    } on Exception catch(e) {
      setAppStatus = AppStatus.ERROR;
      setLoginMsg = e.toString();
      print(e.toString());
    };

  } 
  
}