import 'package:flutter/cupertino.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/helper/api_helper.dart';
import 'package:planet_news/model/news_list_by_catID_model.dart';
import 'package:planet_news/model/search_news_model.dart';

class SearchNewsViewModel with ChangeNotifier{

  String methodName = "get_search_news";

  String videoURL = '';
  String newsDescription = '';
  String newsTitle = '';
  String CatID = '';
  String newsDate = '';
  String newsID = '';

  AppStatus _appStatus = AppStatus.IDLE;
  late SearchNewsModel _searchNewsModel;

  set setNewsID (String newNewsID){
    newsID = newNewsID;
    notifyListeners();
  }
  String get getNewsID => newsID;

  List<SearchNewsList> NewsList=[];

  set setSearchList(List<SearchNewsList> newLatestNews)
  {
    NewsList = newLatestNews;
    notifyListeners();
  }
  List<SearchNewsList> get getSearchLatestNews=>NewsList;

  set setSearchNewsModel (SearchNewsModel _SearchNewsModel)
  {
    _searchNewsModel = _SearchNewsModel;
    notifyListeners();
  }
  SearchNewsModel get getSearchNewsModel => _searchNewsModel;


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


  Future<dynamic> getSearchNews(String userID,String query,{showLoading = true})async
  {
    if(showLoading){
      setAppStatus = AppStatus.LOADING;
    }

    Map <String,dynamic> _body = {
      "method_name":methodName,
      "search": query,
      "user_id": userID
    };

    try{
      dynamic ApiResponse = await ApiBaseHelper().post(body: _body);
      SearchNewsModel _SearchnewsModel = new SearchNewsModel.fromJson(ApiResponse);



      // setNewsTitle = _newsModel.data.latestNews;
      List SearchNewsList = _SearchnewsModel.data;
      setSearchList = _SearchnewsModel.data;
      print("done");
      // setAppStatus = AppStatus.IDLE;
      print(SearchNewsList);
      setNewsTitle = SearchNewsList[0].newsTitle;
      setNewsDescription = SearchNewsList[0].newsDescription;
      setSearchList = _searchNewsModel.data;

      print(SearchNewsList[0].newsTitle);

    } on Exception catch(e)
    {
      print(e);
    }
    setAppStatus = AppStatus.IDLE;
    return NewsList;

  }






}