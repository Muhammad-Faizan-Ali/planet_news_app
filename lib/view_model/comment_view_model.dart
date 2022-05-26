import 'package:flutter/cupertino.dart';
import 'package:planet_news/enum/app_status.dart';
import '../enum/app_status.dart';
import 'package:planet_news/helper/api_helper.dart';
import 'package:provider/provider.dart';
import '../model/comment_model.dart';



class CommentViewModel with ChangeNotifier{
  static const String method_name = "user_comment";
  
  String success_msg = "";
  String statusMsg = '';
  AppStatus _appStatus = AppStatus.IDLE;



  set setSuccessMsg (String newSuccessMsg){
    success_msg = newSuccessMsg;
    notifyListeners();
  }
  String get getSuccessMsg => success_msg;
  set setStatusMsg(String newStatusMsg){
    statusMsg = newStatusMsg;
    notifyListeners();
  }
  String get getStatusMsg => statusMsg;

  set setAppStatus (AppStatus newAppStatus){
    _appStatus = newAppStatus;
    notifyListeners();
  }
  AppStatus get getAppStatus => _appStatus;

  

  Future<dynamic> submitComment(String UID,String NewsID,String CommentTxt,{showLoading = true})async{
    if(showLoading)
    {
      setAppStatus = AppStatus.LOADING;
    }
    Map<String,dynamic> _body = {
          "method_name": method_name,
          "news_id": NewsID,
          "user_id": UID,
          "comment_text": CommentTxt,
    };
    try{
      print("News ID" + NewsID);
      print("User ID" + UID);
      print("Comment "+ CommentTxt);
      dynamic ApiResponse = await ApiBaseHelper().post(body: _body);
      CommentModel _commentModel = new CommentModel.fromJson(ApiResponse);
      if(_commentModel.data![0].success == "1"){
        setSuccessMsg = _commentModel.data![0].success.toString();
        setStatusMsg = _commentModel.data![0].msg.toString();
        setAppStatus = AppStatus.IDLE;  
        print(_commentModel.data![0].msg);
      }
      else{
        print("Failed");
      }
    }on Exception catch(e)
    {
      print(e.toString());
    }

  }





}





  


  






