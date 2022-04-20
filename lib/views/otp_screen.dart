import 'package:flutter/material.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'package:planet_news/app_constant/string_const.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:planet_news/app_constant/decorations.dart';


class OptContainer extends StatelessWidget {
  static const String id = 'otpScreen';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorConst.screen_bg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.4,
              alignment: Alignment.center,
              child: Image.asset("assets/app_logo.png"),
            ),
            Container(
              width: double.infinity,
              // height: 380,
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 5, offset: Offset(0, 2)),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    child: DottedBorder(
                      borderType: BorderType.Circle,
                      radius: Radius.circular(10),
                      strokeWidth: 1,
                      color: Colors.black.withOpacity(0.3),
                      dashPattern: [
                        5,5,5,5
                      ],
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/mobile.png"),
                              )
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  Text("Enter a 4 digit Code",style: TextStyle(fontSize: 16, fontFamily: "Montserrat", fontWeight: FontWeight.w700),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),


                  OtpForm(),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Resend Code",textAlign: TextAlign.right,style: TextStyle(fontSize: 16, fontFamily: "Montserrat", fontWeight: FontWeight.w700),),
                    ],
                  ),
                ],
              ),
            )


          ],
        ),
      ),

    );
  }
}




class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late FocusNode pin2FocusNode;

  late FocusNode pin3FocusNode;

  late FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();

  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  void NextField ({String? value, FocusNode? focusNode})
  {
    if(value!.length==1){
      focusNode!.requestFocus();
    }
  }

  bool isEnabled = true;

  bool isReadOnly = false;

  @override
  Widget build(BuildContext context) {
    return Form(
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: <Widget>[
         Container(
           width: 45,
           height: 45,
           child: TextFormField(
             onChanged: (value)=>NextField(value:value,focusNode: pin2FocusNode),
             enabled: isEnabled,
             keyboardType: TextInputType.number,
             readOnly: isReadOnly,
             autofocus: true,

             obscureText: false,
             textAlign: TextAlign.center,
             style: TextStyle(
               fontSize: 20,
             ),
             cursorColor: Colors.black.withOpacity(0.8),
             decoration: decorations.otpFormDecoraton
           ),
         ),
         Container(
           width: 45,
           height: 45,
           child: TextFormField(
             onChanged: (value)=>NextField(value:value,focusNode: pin3FocusNode),
             enabled: isEnabled,
             keyboardType: TextInputType.number,
             readOnly: isReadOnly,
             autofocus: true,
             focusNode: pin2FocusNode,
             obscureText: false,
             textAlign: TextAlign.center,
             style: TextStyle(
               fontSize: 20,
             ),
             cursorColor: Colors.black.withOpacity(0.8),
             decoration: decorations.otpFormDecoraton,
           ),
         ),
         Container(
           width: 45,
           height: 45,
           child: TextFormField(
             onChanged: (value)=>NextField(value:value,focusNode: pin4FocusNode),

             enabled: isEnabled,
             keyboardType: TextInputType.number,
             readOnly: isReadOnly,
             autofocus: true,
             focusNode: pin3FocusNode,
             obscureText: false,
             textAlign: TextAlign.center,
             style: TextStyle(
               fontSize: 20,
             ),
             cursorColor: Colors.black.withOpacity(0.8),
             decoration: decorations.otpFormDecoraton,
           ),
         ),
         Container(
           width: 45,
           height: 45,
           child: TextFormField(
             enabled: isEnabled,
             keyboardType: TextInputType.number,
             readOnly: isReadOnly,
             autofocus: true,
             focusNode: pin4FocusNode,
             obscureText: false,
             textAlign: TextAlign.center,
             style: TextStyle(
               fontSize: 20,
             ),
             cursorColor: Colors.black.withOpacity(0.8),
             decoration: decorations.otpFormDecoraton,
           ),
         ),
       ],
     ),
    );
  }
}

