import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planet_news/app_constant/ui_constant.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/helper/api_helper.dart';
import 'package:planet_news/model/category_list_model.dart';
import 'package:planet_news/singleton/singletonConsts.dart';

class CategoryListViewModel with ChangeNotifier{

  static const methodName = "get_category";

  String CategoryName = '';
  String CategoryImageSrc = '';
  String CategoryImageSrcThumb = '';
  String CID = '';
  AppStatus _appStatus = AppStatus.IDLE;
  late CategoryListModel _categoryListModel;
  List<CategoryData> catList = [];

  set setCID(String newCID)
  {
    CID = newCID;
    notifyListeners();
  }
  String get getCID => CID;


  set setCategoryList( List<CategoryData> newList)
  {
    catList = newList;
    notifyListeners();
  }
  List<CategoryData> get getCatList => catList;

  set setCategoryListModel(CategoryListModel newCategoryListModel){
    _categoryListModel =  newCategoryListModel;
    notifyListeners();
  }

  CategoryListModel get getCategoryListModel => _categoryListModel;


  set setCategoryName (String newCategoryName){
    CategoryName = newCategoryName;
    notifyListeners();
  }
  String get getCategoryName => CategoryName;

  set setCatImageSrc(String newCatImageSrc)
  {
    CategoryImageSrc = newCatImageSrc;
    notifyListeners();
  }
  String get getCatImageSrc => CategoryImageSrc;

  set setCatImageSrcThumb(String newCatImageSrcThumb)
  {
    CategoryImageSrcThumb = newCatImageSrcThumb;
    notifyListeners();
  }
  String get getCatImageSrcThumb => CategoryImageSrcThumb;




  set setAppStatus(AppStatus newAppStatus)
  {
    _appStatus = newAppStatus;
    notifyListeners();
  }
  AppStatus get getAppStatus => _appStatus;





  Future<dynamic> getNewsCategories(String UID, {showLoading = true})async{
    if(showLoading)
      {
        setAppStatus = AppStatus.LOADING;
      }

    Map<String, dynamic> _body = {
      "method_name": methodName,
      "user_id": Singleton.UserID,
    };

    try{
      dynamic ApiResponse = await ApiBaseHelper().post(body: _body);
      CategoryListModel _catModel = new CategoryListModel.fromJson(ApiResponse);

      if(_catModel.data[0].cid != ""){
        setCategoryName = _catModel.data[0].categoryName;
        setCatImageSrc = _catModel.data[0].categoryImage;
        setCatImageSrcThumb = _catModel.data[0].categoryImageThumb;
        setCategoryList = _catModel.data;
        setCID = _catModel.data[0].cid;


        setAppStatus = AppStatus.IDLE;
      }
    } on Exception catch(e)
    {
      print(e.toString());
    }
  }









}