import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:planet_news/app_constant/color_const.dart';

class FullScreenLoader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitFadingCube(
          size: 50,
          color: ColorConst.home_page_container,
        ),
      ),
    );
  }
}
