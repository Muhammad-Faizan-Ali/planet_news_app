import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planet_news/views/profileView.dart';

import 'package:planet_news/views/search.dart';
import 'package:planet_news/views/search_email_screen.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'Settings.dart';
import 'home_page.dart';
import 'news_home_page_screen.dart';

class BottomBar extends StatefulWidget {
  static String id = 'bottom_bar';
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  // List ScreenTabs = [];
  int currentIndex = 0;
  final ScreenTabs = [
    HomePageScreen(),
    UserProfileScreen(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorConst.home_page_container,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.homeAlt),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: ""),
        ],
        onTap: (index){
          setState(() {
            currentIndex=index;
            print(currentIndex);
          });
        },
      ),
      body: ScreenTabs[currentIndex],
    );
  }
}
