import 'package:flutter/material.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planet_news/views/bottom_bar.dart';
import 'package:planet_news/singleton/singletonConsts.dart';
import 'package:planet_news/views/news_home_page_screen.dart';
import 'package:planet_news/views/privacyPolicy_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:planet_news/view_model/categoryListViewModel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/news_list_by_catID_model.dart';
import '../view_model/news_list_by_catID_ViewModel.dart';
import '../view_model/userProfileViewModel.dart';
List<Widget> DrawerIcons = [
  Icon(Icons.people),
  Icon(FontAwesomeIcons.faceFlushed,color: Colors.black,),
  Icon(FontAwesomeIcons.globe,color: Colors.black),
  Icon(FontAwesomeIcons.music,color: Colors.black),
  Icon(FontAwesomeIcons.football,color: Colors.black),
  Icon(FontAwesomeIcons.theaterMasks,color: Colors.black),
  Icon(FontAwesomeIcons.newspaper,color: Colors.black),
];




class CustomDrawer extends StatefulWidget {

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String finalName = '';
  @override
  void initState() {
    // TODO: implement initState

    getValidationDataName();
    super.initState();
  }
  Future getValidationDataName() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    var obtainedName = sharedPreferences.getString("UserNameKey");
    print("Obtained Name"+obtainedName.toString());
    setState(() {
      finalName = obtainedName!;
    });
    print(finalName);
  }

  @override
  Widget build(BuildContext context) {
    CategoryListViewModel _catViewModel = Provider.of<CategoryListViewModel>(context);
    NewsListByCatIDViewModel _catIDNewsModel = Provider.of<NewsListByCatIDViewModel>(context);

    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.25,
            // width: double.infinity,
            // height: 200,
            color: ColorConst.screen_bg,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 53,
                  backgroundColor: ColorConst.screen_bg,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/app_logo.png'),
                    radius: 50,
                    //child: Icon(FontAwesomeIcons.camera),
                  ),

                ),
                SizedBox(height: 10,),
                Text(finalName==""? "Your Name" : finalName,style: TextStyle(fontSize: 26,color: ColorConst.btn_bg,fontWeight: FontWeight.bold),),

              ],
            )
        ),

        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _catViewModel.getCatList.length,
            itemBuilder: (BuildContext context, int index) {

              return  ListTile(
              title: Text("${_catViewModel.getCatList[index].categoryName}",style: TextStyle(fontWeight: FontWeight.w800,color: ColorConst.btn_bg,fontSize: 24),),
                  leading: DrawerIcons[index],
                    onTap: ()async{
                      List<NewsbyCatIDList> newsList = await Provider.of<NewsListByCatIDViewModel>(context,listen: false).
                      getHomeNews(Singleton.UserID, _catViewModel.getCatList[index].cid);
                      for(var i in newsList)
                        print(i);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>News_updates(
                            CatID: _catViewModel.getCID,
                            newsList: newsList,
                          )));
                    // Navigator.pushNamed(context, News_updates.id);
                    },
                  );
              },
          ),
          ),
      ],
    );
  }
}

