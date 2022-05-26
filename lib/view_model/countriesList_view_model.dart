import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:planet_news/helper/api_helper.dart';
import 'package:planet_news/exceptions/app_exceptions.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/model/countries_list_model.dart';
import 'package:planet_news/model/forgotPassword_model.dart';
import 'package:provider/provider.dart';


class CountriesListViewModel with ChangeNotifier{
  static const String method_name = "get_countries";
  String nickname = "";
  List<CountryData> countryList = [];

  set setCountrireList(List<CountryData> newCountrieList) {
    countryList = newCountrieList;
    notifyListeners();
  }

  List<CountryData> get getCountriesList => countryList;

  late CountriesModel _countriesModel;

  AppStatus app_status = AppStatus.IDLE;

  set SetAppStatus(AppStatus newAppStatus)
  {
    app_status = newAppStatus;
    notifyListeners();
  }
  AppStatus get getAppStatus => app_status;

  set SetcountriesNickname (String newNickNameCountry)
  {
    nickname = newNickNameCountry;
    notifyListeners();
  }

  String get getCountriesName  => nickname;

  set SetCountriesModel(CountriesModel newCountriesModel)
  {
    _countriesModel = newCountriesModel;
    notifyListeners();
  }
  CountriesModel get getCountriesModel => _countriesModel;


  Future<dynamic> getAllCountries ({showLoading = true})async
  {
    if(showLoading)
      {
        SetAppStatus = AppStatus.LOADING;
      }


    Map<String,dynamic> _body = {
      "method_name": method_name,

    };
    try{
      dynamic ApiResponse = await ApiBaseHelper().post(body: _body);

      CountriesModel _model = new CountriesModel.fromJson(ApiResponse);
      print(_model);

      countryList = _model.data;

      print(countryList);

      SetAppStatus = AppStatus.IDLE;
      // for(var country in _model.data)
      //   {
      //     // print(_model.data[0].nicename);
      //     print(country.nicename);
      //     print(country.id)
      //
      //     print(countryList);
      //     notifyListeners();
      //   }
      // print( " Country: "+_model.data[0].nicename);
      // print( " ID: "+_model.data[0].id);
    } on Exception catch(e)
    {
      print(e.toString());
    }

  }





}