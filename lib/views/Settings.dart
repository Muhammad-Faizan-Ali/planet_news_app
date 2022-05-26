import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planet_news/views/about_us_view.dart';
import 'package:planet_news/views/privacyPolicy_view.dart';
import 'package:planet_news/views/signin_screen.dart';
import 'package:planet_news/views/update_profile_screen.dart';
import 'package:planet_news/widgets/full_screen_loader.dart';

import '../app_constant/color_const.dart';
import 'contact_us_screen.dart';
import 'news_home_page_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:in_app_review/in_app_review.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: ColorConst.home_page_container,
        elevation: 0,
        // leading: Padding(
        //   padding: EdgeInsets.only(left: 10.0),
        //   child: Icon(Icons.menu),
        // ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  // height: MediaQuery.of(context).size.height*0.15,
                  height: 150,
                  decoration: BoxDecoration(
                    color: ColorConst.home_page_container,
                    // borderRadius: BorderRadius.only(
                    //   bottomRight: Radius.circular(40),
                    //   bottomLeft: Radius.circular(40),
                    // ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 50),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: ColorConst.screen_bg,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/app_logo.png'),
                            radius: 100,
                            //child: Icon(FontAwesomeIcons.camera),
                          ),
                        ),
                      ),
                      // Icon(Icons.camera_enhance,color: Colors.white,size: 40,),
                    ],
                  )
                  // child:
                  ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Column(
                    children: [
                      ListTile(
                        title: Text("Update Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: ColorConst.btn_bg,
                                fontSize: 24)),
                        leading: Icon(
                          FontAwesomeIcons.person,
                          color: Colors.black,
                        ),
                        onTap: () {


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
                                    return EditUIScreen();
                                  }));
                        },
                      ),
                      ListTile(
                        title: Text("Rate Us",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: ColorConst.btn_bg,
                                fontSize: 24)),
                        leading: Icon(
                          FontAwesomeIcons.star,
                          color: Colors.black,
                        ),
                        onTap: () async {
                          final InAppReview inAppReview = InAppReview.instance;
                          if (await inAppReview.isAvailable()) {
                            inAppReview.requestReview();
                          }
                          //  Navigator.pushNamed(context, MyOrders.id);
                        },
                      ),
                      ListTile(
                        title: Text("Contact Us",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: ColorConst.btn_bg,
                                fontSize: 24)),
                        leading: Icon(
                          FontAwesomeIcons.phone,
                          color: Colors.black,
                        ),
                        onTap: () {
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
                                    return Contact();
                                  }));
                        },
                      ),

ListTile(
                        title: Text("About Us",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: ColorConst.btn_bg,
                                fontSize: 24)),
                        leading: Icon(
                          FontAwesomeIcons.pager,
                          color: Colors.black,
                        ),
                        onTap: () {
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
                                    return AboutUsView();
                                  }));
                        },
                      ),



                      ListTile(
                        title: Text("Privacy Policy",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: ColorConst.btn_bg,
                                fontSize: 24)),
                        leading: Icon(
                          FontAwesomeIcons.clipboardCheck,
                          color: Colors.black,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PrivacyPolicyView()));
                          //  Navigator.pushNamed(context, MyOrders.id);
                        },
                      ),
                      ListTile(
                        title: Text("Logout",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: ColorConst.btn_bg,
                                fontSize: 24)),
                        leading: Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                        onTap: () async {
                          final SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();

                          sharedPreferences.remove("Emailkey");
                          sharedPreferences.remove("UserNameKey");
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicyView()));
                          FullScreenLoader();
                          Navigator.pushReplacementNamed(
                              context, SignInScreen.id);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
