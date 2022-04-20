import 'package:flutter/material.dart';
import 'package:planet_news/app_constant/color_const.dart';

class News_updates extends StatelessWidget {
  static String id = 'news_updates';


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
                height: 120,
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
                          Text("Location Near Faisalabad",style: TextStyle(fontSize: 18,color: Colors.white)),
                          Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 20),


                    Container(
                      height: 150,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(children: [
                            Container(
                              width: 160.0,
                              height:120.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/imrankhkan.jpg",
                                  ),
                                )
                              ),

                            ),
                            Row(
                              children: [
                                Icon(Icons.public),
                                Text("JULY 1,2021 2:52",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w700),),
                              ],
                            )
                            ],
                          ),

                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Text("عمران خان نےبجٹ پیش کر دی",style: TextStyle(color: ColorConst.btn_bg,fontSize: 19),),
                            ],),
                          ),
                        ],
                      )
                    ),
                    Divider(
                      thickness: 1,
                      height: 30,
                      color: Color(0xFF707070),
                    ),
                    Container(
                        height: 150,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(children: [
                              Container(
                                width: 160.0,
                                height:120.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    )
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.public),
                                  Text("JULY 1,2021 2:52",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w700),),
                                ],
                              )
                            ],
                            ),

                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("عمران خان نےبجٹ پیش کر دی",style: TextStyle(color: ColorConst.btn_bg,fontSize: 19),),
                                ],),
                            ),
                          ],
                        )
                    ),
                    Divider(
                      thickness: 1,
                      height: 30,
                      color: Color(0xFF707070),
                    ),
                    Container(
                        height: 150,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(children: [
                              Container(
                                width: 160.0,
                                height:120.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    )
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.public),
                                  Text("JULY 1,2021 2:52",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w700),),
                                ],
                              )
                            ],
                            ),

                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("عمران خان نےبجٹ پیش کر دی",style: TextStyle(color: ColorConst.btn_bg,fontSize: 19),),
                                ],),
                            ),
                          ],
                        )
                    ),
                    Divider(
                      thickness: 1,
                      height: 30,
                      color: Color(0xFF707070),
                    ),
                    Container(
                        height: 150,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(children: [
                              Container(
                                width: 160.0,
                                height:120.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    )
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.public),
                                  Text("JULY 1,2021 2:52",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w700),),
                                ],
                              )
                            ],
                            ),

                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("عمران خان نےبجٹ پیش کر دی",style: TextStyle(color: ColorConst.btn_bg,fontSize: 19),),
                                ],),
                            ),
                          ],
                        )
                    ),
                    Divider(
                      thickness: 1,
                      height: 30,
                      color: Color(0xFF707070),
                    ),
                    Container(
                        height: 150,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(children: [
                              Container(
                                width: 160.0,
                                height:120.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    )
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.public),
                                  Text("JULY 1,2021 2:52",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w700),),
                                ],
                              )
                            ],
                            ),

                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("عمران خان نےبجٹ پیش کر دی",style: TextStyle(color: ColorConst.btn_bg,fontSize: 19),),
                                ],),
                            ),
                          ],
                        )
                    ),
                    Divider(
                      thickness: 1,
                      height: 30,
                      color: Color(0xFF707070),
                    ),
                    Container(
                        height: 150,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(children: [
                              Container(
                                width: 160.0,
                                height:120.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    )
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.public),
                                  Text("JULY 1,2021 2:52",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w700),),
                                ],
                              )
                            ],
                            ),

                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("عمران خان نےبجٹ پیش کر دی",style: TextStyle(color: ColorConst.btn_bg,fontSize: 19),),
                                ],),
                            ),
                          ],
                        )
                    ),
                    Divider(
                      thickness: 1,
                      height: 30,
                      color: Color(0xFF707070),
                    ),
                    Container(
                        height: 150,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(children: [
                              Container(
                                width: 160.0,
                                height:120.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    )
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.public),
                                  Text("JULY 1,2021 2:52",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w700),),
                                ],
                              )
                            ],
                            ),

                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("عمران خان نےبجٹ پیش کر دی",style: TextStyle(color: ColorConst.btn_bg,fontSize: 19),),
                                ],),
                            ),
                          ],
                        )
                    ),
                    Divider(
                      thickness: 1,
                      height: 30,
                      color: Color(0xFF707070),
                    ),
                    Container(
                        height: 150,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(children: [
                              Container(
                                width: 160.0,
                                height:120.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    )
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.public),
                                  Text("JULY 1,2021 2:52",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w700),),
                                ],
                              )
                            ],
                            ),

                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("عمران خان نےبجٹ پیش کر دی",style: TextStyle(color: ColorConst.btn_bg,fontSize: 19),),
                                ],),
                            ),
                          ],
                        )
                    ),
                    Divider(
                      thickness: 1,
                      height: 30,
                      color: Color(0xFF707070),
                    ),

                  ],
                ),
              )

      ),


    );
  }
}

class CustomSearchField extends StatelessWidget {
  String hintText;
  CustomSearchField({
    required this.hintText,
});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //onChanged: (value)=>NextField(value:value,focusNode: pin2FocusNode),
      //   enabled: isEnabled,
      keyboardType: TextInputType.text,
      // readOnly: isReadOnly,
      autofocus: false,
      obscureText: false,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 20,
      ),
      cursorColor: Colors.black.withOpacity(0.8),
      decoration: InputDecoration(
        prefixIcon: Container(
          margin: EdgeInsets.only(right: 10),
          child: Icon(Icons.search,color: Colors.black,),
          decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(width: 1,color: Colors.black)
              )
          ),
        ),
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        contentPadding:
        EdgeInsets.symmetric(horizontal: 10,),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
        ),
      ),
    );
  }
}
