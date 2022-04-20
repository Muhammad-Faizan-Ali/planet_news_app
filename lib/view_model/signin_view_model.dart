import 'package:flutter/cupertino.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/helper/api_helper.dart';
import 'package:planet_news/model/signin_model.dart';

class SigninViewModel with ChangeNotifier {
  static const String method_name = "users_login";
  static const String type = "Normal";
  String _loginMsg = "";

  AppStatus _appStatus = AppStatus.IDLE;

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
  
  Future<dynamic> checkLogin(String email, String password, {showLoading = true}) async {
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

      if(signinModel.data[0].success == "1") {
        setSigninModel = signinModel;
        setLoginMsg = signinModel.data[0].msg;
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