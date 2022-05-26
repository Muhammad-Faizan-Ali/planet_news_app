// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/model/news_list_by_catID_model.dart';
import 'package:planet_news/singleton/singletonConsts.dart';
import 'package:planet_news/view_model/categoryListViewModel.dart';
import 'package:planet_news/view_model/getLocationViewModel.dart';
import 'package:planet_news/view_model/news_list_by_catID_ViewModel.dart';
import 'package:planet_news/views/news_home_page_screen.dart';
import 'package:planet_news/widgets/custom_drawer.dart';
import 'package:planet_news/widgets/full_screen_loader.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_constant/color_const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../view_model/userProfileViewModel.dart';

String UserID = '';
String address = "";

class HomePageScreen extends StatefulWidget {
  static String id = 'home_page';
  var addressCity;
  Position? _currentPosition;


  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  String CityName="";

  Future getLocation ()async{
    CurrentLocationViewModel _model = new CurrentLocationViewModel();
    await _model.getUserLocation();
    //
    // setState((){
    //   Singleton.CityName = address;
    //
    //
    // });
    print("City Name: "+ Singleton.CityName);
  }
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      // widget.getCurrentLocation();
      // getCurrentLocation();
      getLocation();
      getUserID();


    });

    super.initState();
  }
  Future getUserID() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedID = sharedPreferences.getString("UserID");
    setState(() {
      Singleton.UserID = UserID = obtainedID!;
    });
    print("User ID " + Singleton.UserID);
  }



  @override
  Widget build(BuildContext context) {

    CategoryListViewModel _catViewModel = Provider.of<CategoryListViewModel>(context);
    NewsListByCatIDViewModel _catIDNewsModel = Provider.of<NewsListByCatIDViewModel>(context);
    UserProfileViewModel _userProfileModel = Provider.of<UserProfileViewModel>(context);

    TextEditingController _searchController = new TextEditingController();

    return _catViewModel.getAppStatus == AppStatus.LOADING?FullScreenLoader(): Scaffold(
      drawer: Drawer(
        child: CustomDrawer(),
      ),
      backgroundColor: ColorConst.screen_bg,
      appBar: AppBar(
        title: Text(""),
        backgroundColor: ColorConst.home_page_container,
        elevation: 0,
        // leading: Padding(
        //   padding: EdgeInsets.only(left: 10.0),
        //   child: Icon(Icons.menu),
        // ),
        // actions: [
        //   // Padding(
        //   //   padding: EdgeInsets.only(right: 20.0),
        //   //   child: Icon(Icons.person),
        //   // ),
        // ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  // height: MediaQuery.of(context).size.height*0.15,
                  height: 130,
                    decoration: BoxDecoration(
                      color: ColorConst.home_page_container,
                      borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    ),
                    ),
                  child: Column(
                    children: [
                      CustomSearchField(hintText: "Search Here",controller: _searchController,),
                      SizedBox(height: 20,),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.location_on,color: Colors.white,),
                            Flexible(

                              child: Text("${Singleton.CityName == null ? "Select your Location" : " Location Near ${Singleton.CityName}"}"
                                  ,style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "Montserrat")),
                            ),
                            // Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                          ],
                        ),
                      )
                    ],
                  ),
                  ),

                    SizedBox(height: 10),
                 Column(
                    children: [

                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: _catViewModel.getCatList.length,
                        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.3,
                          mainAxisExtent: 170,
                        ),
                        itemBuilder: (context, int index){
                          return InkWell(
                            onTap: ()async{
                              List<NewsbyCatIDList> newsList = await Provider.of<NewsListByCatIDViewModel>(context,listen: false).
                              getHomeNews(Singleton.UserID, _catViewModel.getCatList[index].cid);
                              for(var i in newsList)
                                  print(i);
                              Navigator.push(
                                context,
                                  PageRouteBuilder(
                                      transitionDuration: Duration(milliseconds: 300),
                                      transitionsBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double> secAnimation,
                                          Widget child) {
                                        animation = CurvedAnimation(parent: animation, curve: Curves.easeInOutQuad);
                                        return FadeTransition(opacity: animation, child: child);
                                      },
                                      pageBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double> secAnimation) {
                                        return News_updates(
                                          CatID: _catViewModel.getCID,
                                          newsList: newsList,
                                        );
                                      }));
                              // Navigator.push(context,
                              // MaterialPageRoute(builder: (context)=>News_updates(
                              //   CatID: _catViewModel.getCID,
                              //   newsList: newsList,
                              // )));
                            },
                              child: Center(
                                  child: CategoryContainer(
                                    title: "${_catViewModel.getCatList[index].categoryName}",
                                    imagePath: _catViewModel.getCatList[index].categoryImageThumb,
                                  )
                              )
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                   RichText(
                        text: TextSpan(
   
                          children: [
                            TextSpan(text: "Powered By: ",style: TextStyle(fontSize: 16,color: Colors.black),),
                            TextSpan(text: "PlanetSid.com \u00a9\n",style: TextStyle(fontSize: 16,color: Colors.black.withOpacity(0.7)),),
                          ]
                        ),
                      ),
              ],
            ),

        ),

      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  CategoryContainer({
    required this.imagePath,
    required this.title,
});
  String imagePath;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey, blurRadius: 5, offset: Offset(0, 2)),
        ]
      ),
      // color: Colors.yellow,
      width: 120,
      height: 130,
      child: Column(
        children: <Widget>[
          Image.network(imagePath,height: 90),
          SizedBox(height: 8,),
          FittedBox(
            fit: BoxFit.scaleDown,
              child: Text(title.toUpperCase(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,),)),
        ],

      ),
    );
  }
}


