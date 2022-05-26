import 'package:flutter/cupertino.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/helper/api_helper.dart';
import 'package:planet_news/model/single_news_model.dart';

class SingleNewsViewModel with ChangeNotifier{

  String methodName = "get_single_news";

  List<SingleNewsData> singleNewsList = [];

  String newsTitle = '';
  String videoURL = '';
  String videoID = '';
  String newsDate = '';
  String NewsViews = '';
  AppStatus _appStatus = AppStatus.IDLE;

  set setAppStatus (AppStatus newAppStatus){
    _appStatus = newAppStatus;
    notifyListeners();
  }
  AppStatus get getAppStatus => _appStatus;

  set setSingleNewsList(List<SingleNewsData> newSingleList){
    singleNewsList = newSingleList;
    notifyListeners();
  }
  List<SingleNewsData> get getSingleNewsList => singleNewsList;


  set setNewsTitle (String newNewsTitle){
    newsTitle = newNewsTitle;
    notifyListeners();
  }
  String get getNewsTitle => newsTitle;

  set setVideoID (String newVideoID)
  {
    videoID = newVideoID;
    notifyListeners();
  }
  String get getVideoID => videoID;

  set setNewsDate(String newNewsDate)
  {
    newsDate = newNewsDate;
    notifyListeners();
  }
  String get getNewsID => newsDate;

  set setNewsViews(String newNewsViews){
    NewsViews = newNewsViews;
    notifyListeners();
  }
  String get getNewsViews => NewsViews;


  Future<dynamic> getSingleNews(String newsID, String UID,{showLoading = true})async {

    if(showLoading){
      setAppStatus = AppStatus.LOADING;
    }

    Map<String,dynamic> _body = {
      "method_name": methodName,
      "news_id": newsID,
      "user_id": UID,
    };
    try{

      dynamic APIResponse = await ApiBaseHelper().post(body: _body);
      SingleNewsModel _newsModel = new SingleNewsModel.fromJson(APIResponse);
      // setSingleNewsList = _newsModel.data[0];



      if(_newsModel.data[0].newsTitle != "")
        {

          setNewsTitle =  _newsModel.data[0].newsTitle;
          setNewsDate =   _newsModel.data[0].newsDate;
          setNewsViews =  _newsModel.data[0].newsViews;
          setSingleNewsList = _newsModel.data;

        }
      setAppStatus = AppStatus.IDLE;
    } on Exception catch(e){
      print(e.toString());
    }







  }






}