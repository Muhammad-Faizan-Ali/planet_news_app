import 'package:flutter/cupertino.dart';
import 'package:planet_news/helper/api_helper.dart';
import 'package:planet_news/model/resendOTPModel.dart';

class ResendOTPViewModel with ChangeNotifier{
  String MethodName = "send_otp";
  String _SuccessMsg = "";

  String get getSuccessMsg => _SuccessMsg;

  set setSuccessMsg(String SuccessMsg) {
    _SuccessMsg = SuccessMsg;
    notifyListeners();
  }

  Future getResendOTP(String Email,{showLoading = true})async{

    Map<String,dynamic> _body = {
      "method_name" : MethodName,
      "email" : Email
    };

    try{
      print("Calling Resend API");
      dynamic ApiResponse = await ApiBaseHelper().post(body: _body);
      ResendOTPModel _resendModel = new ResendOTPModel.fromJson(ApiResponse);
      print("Resend OTP Called");

      if(_resendModel.data[0].success == "1")
        {
          setSuccessMsg = _resendModel.data[0].success;
        }
    }on Exception catch(e)
    {
      print(e);
    }


  }








}