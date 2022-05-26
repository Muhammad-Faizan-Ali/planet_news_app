import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/helper/api_helper.dart';
import 'package:planet_news/model/user_news_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:image_cropper/image_cropper.dart';


class UserNewsViewModel with ChangeNotifier{
  File? _image;
  File? selectedImageName;
  File? selectedImagePath;
  final imagePicker = ImagePicker();


  int NewsID = 0;
  String successMsg = '';
  String methodName = "user_news";

  Uint8List? imagebytes;
  String? base64string;

  set setbase64string(String newbase64string)
  {
    base64string = newbase64string;
    notifyListeners();
  }
  String get getbase64string => base64string.toString();



  late UserNewsModel _newsModel;
  AppStatus _appStatus = AppStatus.IDLE;

  set setSelectedImageName(File? newSelectedImage)
  {
    selectedImageName = newSelectedImage;
    notifyListeners();
  }
  File? get getSelectedImage => selectedImageName;

  set setSelectedImagePath(File? newSelectedImagePath)
  {
    selectedImagePath = newSelectedImagePath;
    notifyListeners();
  }
  File? get getSelectedImagePath => selectedImagePath;


  set setAppStatus(AppStatus newAppStatus){
    _appStatus = newAppStatus;
    notifyListeners();
  }

  set setNewsID(int newNewsID)
  {
    NewsID = newNewsID;
    notifyListeners();
  }
  int get getNewsID => NewsID;

  set setSuccessMsg(String newSuccessMsg){
    successMsg = newSuccessMsg;
    notifyListeners();
  }
  String get getSuccessMsg => successMsg;

  set setUserNewsModel(UserNewsModel _newUserNewsModel)
  {
    _newsModel = _newUserNewsModel;
    notifyListeners();
  }
  UserNewsModel get getUserNewsModel => _newsModel;



  Future getImageFromPhone(ImageSource img_source) async{
    try{
      var _image = await imagePicker.pickImage(source: img_source);

      if(_image == null) return;
      final imageTemporaryName = File(_image.name);
      setSelectedImageName = imageTemporaryName;
      setSelectedImagePath = File(_image.path);
      if(getSelectedImagePath != "")
        {
          imagebytes = await getSelectedImagePath?.readAsBytes(); //convert to bytes
          base64string  = base64.encode(imagebytes!); //convert bytes to base64 string
          print("Base 64 String : "+ base64string.toString());
        }
      print(imageTemporaryName);

      return _image;

      // setState(() {
      //   this._image = cropped_image;
      //   //this._image = imageTemporaryName;
      //   print("Image Taken");
      // });
    }
    on Exception catch(e)
    {
      print("Image Failed $e");
    }
  }








  Future submitNewsImage(String NewsImageEncoded, String newsTitle,String newsDescription,String UID,{showLoading = true})async{
    if(showLoading){
      setAppStatus = AppStatus.LOADING;
    }
    Map<String,dynamic> _body = {
      "method_name": methodName,
      "cat_id": "",
      "news_type": "image",
      "video_url": "",
      "news_image": NewsImageEncoded,
      "news_title": newsTitle,
      "news_description": newsDescription,
      "creator_id": UID,
      "created_by": "user",
    };
    try{
      dynamic ApiResponse = await ApiBaseHelper().post(body: _body);
      UserNewsModel _userNewsModel = new UserNewsModel.fromJson(ApiResponse);

      if(_userNewsModel.data[0].success == "1"){
        setUserNewsModel = _userNewsModel;
        setSuccessMsg = _userNewsModel.data[0].success;

        print(_userNewsModel.data[0].success);
      }

    }on Exception catch(e)
    {
      print("Exception: ${e.toString()}");
    }
  }




  Future submitNewsVideo(String VideoURL, String newsTitle,String newsDescription,String UID,{showLoading = true})async{
    if(showLoading){
      setAppStatus = AppStatus.LOADING;
    }
    Map<String,dynamic> _body = {
      "method_name": methodName,
      "cat_id": "",
      "news_type": "video",
      "video_url": VideoURL,
      "news_image": "",
      "news_title": newsTitle,
      "news_description": newsDescription,
      "creator_id": 24,
      "created_by": UID
    };
    try{
      dynamic ApiResponse = await ApiBaseHelper().post(body: _body);
      UserNewsModel _userNewsModel = new UserNewsModel.fromJson(ApiResponse);

      if(_userNewsModel.data[0].success == "1"){
        setUserNewsModel = _userNewsModel;
        setSuccessMsg = _userNewsModel.data[0].success;
      }

    }on Exception catch(e)
    {
      print("Exception: ${e.toString()}");
    }
  }




}