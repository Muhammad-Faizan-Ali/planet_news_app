import 'package:flutter/material.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'package:planet_news/widgets/custom_button.dart';
import '';
import 'news_home_page_screen.dart';


class Contact extends StatefulWidget {
  static String id = 'contact';

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: ColorConst.screen_bg,
      appBar: AppBar(
        title: Text(""),
        backgroundColor: ColorConst.home_page_container,
        elevation: 0,

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                height: 150,
                decoration: BoxDecoration(
                  color: ColorConst.home_page_container,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                ),

                child: Column(
                  children: [
                    CustomSearchField(
                      hintText: "Search Here",
                    ),
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
             SizedBox(height: 20,),



             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20.0),
               child: Container(
                 child: Text("Contact".toUpperCase(),style: TextStyle(
                   decoration: TextDecoration.underline,
                     fontWeight: FontWeight.w800,
                     color: ColorConst.btn_bg,
                     fontSize: 32)),
               ),
             ),

             // SizedBox(height: MediaQuery.of(context).size.height*0.01),
              //
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child:  Column(
                    children: [
                      ListTile(
                        title: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 0),
                          ),
                        ),
                        leading: Icon(Icons.mail,color: Colors.black,size: 30,),
                      ),
                      ListTile(
                        title: TextFormField(),
                        leading: Icon(Icons.phone,color: Colors.black,size: 30,),
                      ),
                      ListTile(
                        title: TextFormField(),
                        leading: Icon(Icons.public,color: Colors.black,size: 30,),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: TextFormField(
                            minLines: 8,
                            maxLines: 20,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorConst.borderColor,
                                    width: 2,
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 100.0),
                            child: SimpleButton(
                              btnText: 'Send',
                              onPressed: (){
                                setState(() {
                                  showDialog (
                                    context: context,
                                    builder: (BuildContext context){
                                      return Container(

                                        child: AlertDialog(
                                          title: Image.asset("assets/smile.png",),
                                          content: Text("Your Request has been sent",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w700),),
                                          actions: [
                                            SimpleButton(
                                                onPressed: (){Navigator.pop(context);},
                                                btnText: "Ok")
                                          ],
                                        ),
                                      );
                                    }

                                  );
                                });

                              },
                            ),
                          ),
                        ],
                      )
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
