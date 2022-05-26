import 'package:flutter/material.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/helper/api_helper.dart';
import 'package:planet_news/model/user_profile_model.dart';

import '../singleton/singletonConsts.dart';

class UserProfileViewModel with ChangeNotifier{
  String MethodName = "user_profile";
  String _UserName = '';
  String _UserEmail ='';
  String _UserGender ='';
  String _CountryName ='';
  String _PhoneNumber ='';
  AppStatus _appStatus = AppStatus.IDLE;
  late UserProfileModel _profileModel;



  set setappStatus(AppStatus appStatus) {
    _appStatus = appStatus;
    notifyListeners();
  }
  AppStatus get getappStatus => _appStatus;
  set setPhoneNumber(String PhoneNumber) {
    _PhoneNumber = PhoneNumber;
    notifyListeners();
  }
  String get getPhoneNumber => _PhoneNumber;
  set setCountryName(String CountryName) {
    _CountryName = CountryName;
    notifyListeners();
  }
  String get getCountryName => _CountryName;
  set setUserGender(String UserGender) {
    _UserGender = UserGender;
    notifyListeners();
  }
  String get getUserGender => _UserGender;
  set setUserEmail(String UserEmail) {
    _UserEmail = UserEmail;
    notifyListeners();
  }
  String get getUserEmail => _UserEmail;
  set setUserName(String UserName) {
    _UserName = UserName;
    notifyListeners();
  }
  String get getUserName => _UserName;
  set SetprofileModel(UserProfileModel value) {
    _profileModel = value;
    notifyListeners();
  }
  UserProfileModel get getprofileModel => _profileModel;




  Future<dynamic> getUserProfile (String UID,{showLoading = true})async{
    if(showLoading){
      setappStatus = AppStatus.LOADING;
    }
    Map<String,dynamic> _body = {
      "method_name": MethodName,
      "id": UID,
    };

    try{
      dynamic ApiResponse = await ApiBaseHelper().post(body: _body);
      UserProfileModel _profileModel = new UserProfileModel.fromJson(ApiResponse);
      if(_profileModel.data[0].success == "1")
        {

          setUserName = _profileModel.data[0].name;
          setUserEmail = _profileModel.data[0].email;
          setCountryName = _profileModel.data[0].countryName;
          setPhoneNumber = _profileModel.data[0].phone;
          setUserGender = _profileModel.data[0].gender;

          Singleton.tempGenderVal = _profileModel.data[0].gender;
          Singleton.CountryVal = _profileModel.data[0].countryName;


          print(getUserName);
          print(getUserGender);
          print(getUserEmail);
          print(getPhoneNumber);
          print(getCountryName);
          SetprofileModel = _profileModel;
          setappStatus = AppStatus.IDLE;
        }
    }on Exception catch(e)
    {
      print(e);
    }

  }









}