import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class AboutUsView extends StatelessWidget {
  _launchURL() async {
  const url = 'http://planetsid.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  static String id = "aboutUs";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
              
                "Owner's Information",style: TextStyle(fontSize: 36,fontWeight: FontWeight.w800),textAlign: TextAlign.center,),

              SizedBox(height: 20,),


              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Name: ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.black),
                    ),
                    TextSpan(
                      text: "Sidra Anwaar",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w300,color: Colors.black),
                    ),
                    
                  ]
                )
              ),
              SizedBox(height: 20,),

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Email: ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.black),
                    ),
                    TextSpan(
                      text: "sidraanwer7777@gmail.com",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w300,color: Colors.black),
                    ),
                    
                  ]
                )
              ),
              SizedBox(height: 20,),
RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Phone# ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.black),
                    ),
                    TextSpan(
                      text: "+92-303-0170007",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w300,color: Colors.black),
                    ),
                    
                  ]
                )
              ),
              SizedBox(height:20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Address: ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.black),
                    ),
                    TextSpan(
                      text: "Mall of Faisalabad, Chak 208 Rd, Zia Colony Nasar Ullah Khan Town, Faisalabad, Punjab 38000",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w300,color: Colors.black),
                    ),
                    
                  ]
                )
              ),
              SizedBox(height: 20,),

              
              SizedBox(height: 20,),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Website: ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.black),
                    ),
                    
                  ]
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(onPressed: _launchURL,
                   child: Text("https://www.planetsid.com/")),
                ],
              ),

              SizedBox(height: 20,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     
                    ],
                  ),
              
            ]
            ),
        ),
      ),
      
    );
  }
}