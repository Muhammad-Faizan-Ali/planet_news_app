import 'package:flutter/cupertino.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/helper/api_helper.dart';
import 'package:planet_news/model/privacy_policy_model.dart';

class PrivacyPolicyViewModel with ChangeNotifier{
  static const String method_name = "app_privacy_policy";
  AppStatus _appStatus = AppStatus.IDLE;

  late PrivacyPolicyModel _policyModel;
  String privacyText = '';

  set SetAppStatus(AppStatus newAppStatus){
    _appStatus = newAppStatus;
    notifyListeners();
  }
  AppStatus get getAppStatus => _appStatus;

  set SetPrivacyText (String newPrivacyText){
    privacyText = newPrivacyText;
    notifyListeners();
    print(privacyText);
  }
  String get getPrivacyText => privacyText;

  set setPrivacyModel(PrivacyPolicyModel newPrivacyPolicyModel){
    _policyModel = newPrivacyPolicyModel;
    notifyListeners();
  }
  PrivacyPolicyModel get getPrivacyModel => _policyModel;


  Future<dynamic> getPrivacyPolicy({showLoading = true})async{
    if(showLoading){
      SetAppStatus = AppStatus.LOADING;
    }


    Map<String,dynamic> _body={
      "method_name": method_name
    };

    try {
      dynamic ApiResponse = await ApiBaseHelper().post(body: _body);
      PrivacyPolicyModel _Privacymodel = PrivacyPolicyModel.fromJson(ApiResponse);
      print("Privacy Text = "+_Privacymodel.appPrivacyPolicy);

      SetPrivacyText = _Privacymodel.appPrivacyPolicy;
      SetAppStatus = AppStatus.IDLE;

    } on Exception catch(e)
    {
      print(e.toString());
    }



  }


}