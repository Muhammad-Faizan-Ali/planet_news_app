import 'package:flutter/cupertino.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/helper/api_helper.dart';
import 'package:planet_news/model/news_list_by_catID_model.dart';

class NewsListByCatIDViewModel with ChangeNotifier{

  String methodName = "get_news_by_cat_id";

  String videoURL = '';
  String newsDescription = '';
  String newsTitle = '';
  String CatID = '';
  String newsDate = '';
  String newsID = '';

  AppStatus _appStatus = AppStatus.IDLE;
  late NewsListByCatIDModel _newsModel;

  set setNewsID (String newNewsID){
    newsID = newNewsID;
    notifyListeners();
  }
  String get getNewsID => newsID;

  List<NewsbyCatIDList> NewsList=[];

  set setCountryList(List<NewsbyCatIDList> newLatestNews)
  {
    NewsList = newLatestNews;
    notifyListeners();
  }
  List<NewsbyCatIDList> get getLatestNews=>NewsList;

  set setHomeNewsModel (NewsListByCatIDModel _NewhomeNewsModel)
  {
    _newsModel = _NewhomeNewsModel;
    notifyListeners();
  }
  NewsListByCatIDModel get getHomeNewsModel => _newsModel;


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


  Future<dynamic> getHomeNews(String userID,String CatID,{showLoading = true})async
  {
    if(showLoading){
      setAppStatus = AppStatus.LOADING;
    }
    Map <String,dynamic> _body = {
      "method_name":methodName,
      "cat_id": CatID,
      "user_id": userID
    };

    try{
      dynamic ApiResponse = await ApiBaseHelper().post(body: _body);
      NewsListByCatIDModel _newsModel = new NewsListByCatIDModel.fromJson(ApiResponse);

      // setNewsTitle = _newsModel.data.latestNews;
      NewsList = _newsModel.data;
      // setAppStatus = AppStatus.IDLE;


      print(NewsList);
      setNewsTitle = NewsList[0].newsTitle;
      setNewsDescription = NewsList[0].newsDescription;

      print(NewsList[0].newsTitle);

    } on Exception catch(e)
    {
      print(e);
    }
    setAppStatus = AppStatus.IDLE;
    return NewsList;




  }





}