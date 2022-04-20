import 'package:flutter/material.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planet_news/views/bottom_bar.dart';
class CustomDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
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
                Text("YOUR NAME ",style: TextStyle(fontSize: 26,color: ColorConst.btn_bg,fontWeight: FontWeight.bold),),

              ],
            )
        ),

        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    title: Text("Latest",style: TextStyle(fontWeight: FontWeight.w800,color: ColorConst.btn_bg,fontSize: 24),),
                    leading: Icon(FontAwesomeIcons.recycle,color: Colors.black,),
                    onTap: (){
                      Navigator.pushNamed(context, BottomBar.id);
                    },
                  ),

                  ListTile(
                    title: Text("Science",style: TextStyle(fontWeight: FontWeight.w800,color: ColorConst.btn_bg,fontSize: 24)),
                    leading: Icon(FontAwesomeIcons.microscope,color: Colors.black,),
                    onTap: (){
                      //  Navigator.pushNamed(context, MyOrders.id);
                    },
                  ),

                  ListTile(
                   // onTap: ()=>Navigator.pushNamed(context, GeneralSettings.id),
                    title: Text("Sports",style: TextStyle(fontWeight: FontWeight.w800,color: ColorConst.btn_bg,fontSize: 24)),
                    leading: Icon(FontAwesomeIcons.football,color: Colors.black,),
                    onTap: (){
                      //  Navigator.pushNamed(context, MyOrders.id);
                    },
                  ),

                  ListTile(
                    title: Text("Entertainment",style: TextStyle(fontWeight: FontWeight.w800,color: ColorConst.btn_bg,fontSize: 24)),
                    leading: Icon(FontAwesomeIcons.film,color: Colors.black,),
                    onTap: (){
                      //  Navigator.pushNamed(context, MyOrders.id);
                    },
                  ),

                  ListTile(
                    title: Text("Business",style: TextStyle(fontWeight: FontWeight.w800,color: ColorConst.btn_bg,fontSize: 24)),
                    leading: Icon(FontAwesomeIcons.peopleGroup,color: Colors.black,),
                    onTap: (){
                      //  Navigator.pushNamed(context, MyOrders.id);
                    },
                  ),

                  ListTile(
                    title: Text("Rate Us",style: TextStyle(fontWeight: FontWeight.w800,color: ColorConst.btn_bg,fontSize: 24)),
                    leading: Icon(FontAwesomeIcons.star,color: Colors.black,),
                    onTap: (){
                      //  Navigator.pushNamed(context, MyOrders.id);
                    },
                  ),

                  ListTile(
                    title: Text("Contact Us",style: TextStyle(fontWeight: FontWeight.w800,color: ColorConst.btn_bg,fontSize: 24)),
                    leading: Icon(FontAwesomeIcons.phone,color: Colors.black,),
                    onTap: (){
                      //  Navigator.pushNamed(context, MyOrders.id);
                    },
                  ),

                  ListTile(
                    title: Text("Settings",style: TextStyle(fontWeight: FontWeight.w800,color: ColorConst.btn_bg,fontSize: 24)),
                    leading: Icon(Icons.settings,color: Colors.black,),
                    onTap: (){
                      //  Navigator.pushNamed(context, MyOrders.id);
                    },
                  ),

                  ListTile(
                    title: Text("Privacy Policy",style: TextStyle(fontWeight: FontWeight.w800,color: ColorConst.btn_bg,fontSize: 24)),
                    leading: Icon(FontAwesomeIcons.clipboardCheck,color: Colors.black,),
                    onTap: (){
                      //  Navigator.pushNamed(context, MyOrders.id);
                    },
                  ),




                ],
              ),
            ],

          ),
        )
      ],
    );
  }
}


