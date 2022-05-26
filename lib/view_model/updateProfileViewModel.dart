import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:planet_news/model/update_profile_model.dart';

import '../enum/app_status.dart';
import '../helper/api_helper.dart';

class UpdateProfileViewModel with ChangeNotifier{
  String methodName = "user_profile_update";
  AppStatus _appStatus = AppStatus.IDLE;
  String resMsg = '';
  String successMsg = "";

  late UpdateProfileModel _updateProfileModel;

  set setUpdateProfileModel(UpdateProfileModel newUpdateProfileModel){
    _updateProfileModel = newUpdateProfileModel;
    notifyListeners();
  }
  UpdateProfileModel? get getUpdateProfileModel => _updateProfileModel;

  set setAppStatus(AppStatus newAppStatus){
    _appStatus = newAppStatus;
    notifyListeners();
  }
  AppStatus get getAppStatus => _appStatus;

  set setResMsg(String newResMsg){
    resMsg = newResMsg;
    notifyListeners();
  }
  String get getResMsg => resMsg;

  set setSuccessMsg(String newSuccessMsg){
    successMsg = newSuccessMsg;
    notifyListeners();
  }
  String get getsuccessMsg => successMsg;


  Future<dynamic> updateProfile(String name,String email, String password,String phNumber,String gender,String UID,String countryID,{showLoading = true})async{
    if(showLoading)
      {
        setAppStatus = AppStatus.LOADING;
      }
    Map<String,dynamic> _body = {
      "method_name": methodName,
      "user_id": UID,
      "name": name,
      "email": email,
      "password": password,
      "phone": phNumber,
      "country_id": 3,
      "gender": gender
    };

    try{
      dynamic APIResponse = await ApiBaseHelper().post(body: _body);
      UpdateProfileModel _profileModel = new UpdateProfileModel.fromJson(APIResponse);
      if(_profileModel.data[0].success == "1"){
        setResMsg = _profileModel.data[0].msg;
        setAppStatus = AppStatus.IDLE;
        setResMsg = _profileModel.data[0].success;
        // setUpdateProfileModel = _updateProfileModel;
        setUpdateProfileModel = _profileModel;

        // print("");
        // print("Ok hogya");
      }

    } on Exception catch(e)
    {
      print("Exception: ${e.toString()}");
    }
  }


}