import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planet_news/views/news_home_page_screen.dart';
import 'package:planet_news/widgets/custom_drawer.dart';
import '../app_constant/color_const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageScreen extends StatelessWidget {
  static String id = 'home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  height: MediaQuery.of(context).size.height*0.15,
                    decoration: BoxDecoration(
                      color: ColorConst.home_page_container,
                      borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    ),
                    ),
                  child: Column(
                    children: [
                      CustomSearchField(hintText: "Search Here"),
                      SizedBox(height: 20,),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.location_on,color: Colors.white,),
                            Text("Location Near Faisalabad",style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: "Montserrat")),
                            Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                          ],
                        ),
                      )
                    ],
                  ),
                  ),

                    SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          direction: Axis.horizontal,
                          spacing: 80.0,
                          runSpacing: 20.0,

                          children: [
                            CategoryContainer(title: "SHOPS", imagePath: "assets/shop.jpeg",),
                            CategoryContainer(title: "Brands", imagePath: "assets/girl.png",),
                            CategoryContainer(imagePath: "assets/cart.png", title: "Shopping"),
                            CategoryContainer(imagePath: "assets/wholesale.png", title: "WholeSale"),
                            CategoryContainer(imagePath: "assets/discount.png", title: "Shops"),
                            CategoryContainer(imagePath: "assets/kids.png", title: "Shops"),
                            CategoryContainer(imagePath: "assets/suppliers.png", title: "Shops"),
                            CategoryContainer(imagePath: "assets/shakehand.png", title: "Shops"),
                            CategoryContainer(imagePath: "assets/suppliers.png", title: "Shops"),
                            CategoryContainer(imagePath: "assets/shakehand.png", title: "Shops"),

                          ],
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
      width: 130,
      height: 135,
      child: Column(
        children: <Widget>[
          Image.asset(imagePath,height: 100),
          SizedBox(height: 8,),
          Text(title.toUpperCase(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,),),
        ],
      ),
    );
  }
}
