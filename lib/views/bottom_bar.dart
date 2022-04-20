import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planet_news/views/refresh_screen.dart';
import 'package:planet_news/views/search_email_screen.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'Settings.dart';
import 'news_home_page_screen.dart';

class BottomBar extends StatefulWidget {
  static String id = 'bottom_bar';
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  final ScreenTabs = [
    News_updates(),
    Refresh(),
    SearchEmail(),
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
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.refresh),label: ""),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.search),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: ""),
        ],
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
      ),
      body: ScreenTabs[currentIndex],
    );
  }
}
