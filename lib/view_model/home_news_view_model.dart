import 'package:flutter/cupertino.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/helper/api_helper.dart';
import 'package:planet_news/model/home_news_model.dart';
import 'package:planet_news/singleton/singletonConsts.dart';



class HomeNewsViewModel with ChangeNotifier{
  String MethodName = "get_home_news";

  String videoURL = '';
  String newsDescription = '';
  String newsTitle = '';
  String CatID = '';
  String newsDate = '';
  String newsID = '';

  AppStatus _appStatus = AppStatus.IDLE;
  late HomeNewsModel _newsModel;

  set setNewsID (String newNewsID){
    newsID = newNewsID;
    notifyListeners();
  }
  String get getNewsID => newsID;

  List<LatestNews> latestNewsList=[];

  set setCountryList(List<LatestNews> newLatestNews)
  {
    latestNewsList = newLatestNews;
    notifyListeners();
  }
  List<LatestNews> get getLatestNews=>latestNewsList;

  set setHomeNewsModel (HomeNewsModel _NewhomeNewsModel)
  {
    _newsModel = _NewhomeNewsModel;
    notifyListeners();
  }
  HomeNewsModel get getHomeNewsModel => _newsModel;


  set setAppStatus (AppStatus newAppStatus)
  {
    _appStatus = newAppStatus;
    notifyListeners();
  }
  AppStatus get getAppStatus => _appStatus;


  set setVideoURL(String newVideoURL){
    videoURL = newVideoURL;
    notifyListeners();
  }
  String get getVideoURL => videoURL;

  set setNewsDescription(String newNewsDescription){
    newsDescription = newNewsDescription;
    notifyListeners();
  }
  String get getNewsDescription =>newsDescription;

  set setNewsTitle(String newNewstitle)
  {
    newsTitle = newNewstitle;
    notifyListeners();
  }
  String get getNewsTitle => newsTitle;

  set setCatID(String newCatID)
  {
    CatID = newCatID;
    notifyListeners();
  }
  String get getCatID => CatID;

  set setnewsDate(String newNewsDate)
  {
    newsDate = newNewsDate;
    notifyListeners();
  }
  String get getnewsDate => newsDate;

  Future<dynamic> getHomeNews(String userID,{showLoading = true})async
  {
    if(showLoading){
      setAppStatus = AppStatus.LOADING;
    }
    Map <String,dynamic> _body = {
      "method_name": MethodName,
      "user_id": Singleton.UserID,
    };

    try{
      dynamic ApiResponse = await ApiBaseHelper().post(body: _body);
      HomeNewsModel _newsModel = new HomeNewsModel.fromJson(ApiResponse);

      // setNewsTitle = _newsModel.data.latestNews;
      latestNewsList = _newsModel.data.latestNews;
      setAppStatus = AppStatus.IDLE;


      print(latestNewsList);
      setNewsTitle = latestNewsList[0].newsTitle;
      setNewsDescription = latestNewsList[0].newsDescription;

      print(_newsModel.data.latestNews[0].newsTitle);

    } on Exception catch(e)
    {
      print(e);
    }




  }



}