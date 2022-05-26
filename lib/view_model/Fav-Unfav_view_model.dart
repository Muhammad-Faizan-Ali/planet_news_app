// ignore_for_file: unused_field, prefer_final_fields, unnecessary_string_interpolations, unnecessary_new, unnecessary_brace_in_string_interps

import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/helper/api_helper.dart';
import 'package:planet_news/model/fav-Unfav_model.dart';


class FavUnfavViewModel with ChangeNotifier{
  static const String methodName = "add_favourite";
  String statusMsg = '';
  String resultMsg = '';

  AppStatus _appStatus = AppStatus.IDLE;

  set setAppStatus(AppStatus newAppStatus){
    _appStatus = newAppStatus;
    notifyListeners();
  }
  AppStatus get getAppStatus => _appStatus;

  late FavUnfavModel _unfavModel; 

  set setStatusMsg (String newStatusMsg){
    statusMsg = newStatusMsg;
    notifyListeners();
  }
  String get getStatusMsg => statusMsg;

  set setResultMsg(String newResultMsg){
    resultMsg = newResultMsg;
    notifyListeners();
  }
  String get getResultMsg => resultMsg;


  set setFavUnfavModel(FavUnfavModel newFavUnfavModel)
  {
    _unfavModel = newFavUnfavModel;
    notifyListeners();
  }

  Future<dynamic> addToFav(String newsID, String UID, {showLoading = true})async{
    if(showLoading){
      setAppStatus = AppStatus.LOADING;
    }

    Map<String,dynamic> _body = {
      "method_name": methodName,
      "post_id": "${newsID}",
      "user_id": "${UID}",
    };

    try{
      dynamic ApiResponse = await ApiBaseHelper().post(body: _body);
      FavUnfavModel _favUnfavModel = new FavUnfavModel.fromJson(ApiResponse);

      if(_favUnfavModel.status == "1")
      {
        setFavUnfavModel = _favUnfavModel;
        setStatusMsg = _favUnfavModel.status;
        setResultMsg = _favUnfavModel.msg;
        setAppStatus = AppStatus.IDLE;

        print("Api Responsed ${_favUnfavModel}");

      }

    }on Exception catch(e)
    {
      print("Exception: "+ e.toString());
    }



  }





  




}