import 'package:flutter/cupertino.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/helper/api_helper.dart';

import '../model/confirm_otp_model.dart';

class ConfirmOTPViewModel with ChangeNotifier{

  static String methodName = "confirm_otp";
  String successMsg = "";
  String resMsg = "";
  late ConfirmOTPModel _Otpmodel;
  AppStatus _appStatus = AppStatus.IDLE;

  set setSucessMsg (String newSucessMsg){
    successMsg = newSucessMsg;
    notifyListeners();
  }
  String get getSuccessMsg => successMsg;

  set setResultMsg(String newResMsg){
    resMsg = newResMsg;
    notifyListeners();
  }
  String get getResMsg => resMsg;

  set setAppStatus(AppStatus newAppStatus){
    _appStatus = newAppStatus;
    notifyListeners();
  }
  AppStatus get getAppStatus => _appStatus;

  bool otpStatus = false;
  set setOtpStatus (bool newOtpStatus) {
    otpStatus = newOtpStatus;
    notifyListeners();
  }
  bool get getOtpStatus => otpStatus;



  Future confirmOTP(String email, String OTP,{showLoading = true})async{
    if(showLoading){
      setAppStatus = AppStatus.LOADING;
    }

    Map<String, dynamic> _body = {
      "method_name": methodName,
      "email": email,
      "otp": OTP,
    };

    try{
      dynamic ApiResponse = await ApiBaseHelper().post(body: _body);
      ConfirmOTPModel _confirmModel = new ConfirmOTPModel.fromJson(ApiResponse);

      if(_confirmModel.data[0].success == "1"){
        print("OTP Correct");
        setOtpStatus = true;
        setResultMsg = _confirmModel.data[0].msg;
        setSucessMsg = _confirmModel.data[0].success;
        setAppStatus = AppStatus.IDLE;
      }
      else {
        setAppStatus = AppStatus.IDLE;
      }

    } on Exception catch(e)
    {
      setAppStatus = AppStatus.IDLE;
      print(e);
    }
  }
}