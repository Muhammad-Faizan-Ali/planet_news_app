import 'package:flutter/material.dart';
import 'package:planet_news/app_constant/ui_constant.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/view_model/forgot_password_view_model.dart';
import 'package:planet_news/widgets/custom_button.dart';
import 'package:planet_news/widgets/custom_input_field.dart';
import 'package:planet_news/widgets/full_screen_loader.dart';
import 'package:provider/provider.dart';
class SearchEmail extends StatelessWidget {
  static String id = 'search_email';
  TextEditingController txtController = new TextEditingController();
  late String email;

  @override

  Widget build(BuildContext context) {
    ForgotPasswordViewModel _forgotViewModel = Provider.of<ForgotPasswordViewModel>(context);
    return Scaffold(
      body: (_forgotViewModel.getAppStatus == AppStatus.LOADING)?FullScreenLoader(): SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: 260,
              alignment: Alignment.center,
              child: Image.asset("assets/app_logo.png"),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.3,
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                      TextFormField(
                          //onChanged: (value)=>NextField(value:value,focusNode: pin2FocusNode),
                          //   enabled: isEnabled,
                          keyboardType: TextInputType.text,
                          // readOnly: isReadOnly,
                          autofocus: false,
                          controller: txtController,
                          obscureText: false,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          cursorColor: Colors.black.withOpacity(0.8),
                          decoration: InputDecoration(

                            hintText: "Enter Your Mail Or Number",
                            hintStyle: TextStyle(fontSize: 17),
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
                        ),

                      SizedBox(height: 20,),
                      Container(
                        width: 130,
                        child: SearchButton(onPressed: ()async{
                          email = txtController.value.text.toString().trim();
                          print(email);

                          await Provider.of<ForgotPasswordViewModel>(context,listen: false).forgetPassword(email);
                          String forgotmsg = _forgotViewModel.getForgotMsg;
                          showSnackBar(context: context, message: forgotmsg, mColor: Colors.grey);

                          // Navigator.pushNamed(context, SignInScreen.id);
                        }, btnText: "SEARCH"),
                      ),
                    ],
                  ),
              ),




          ],
        ),
      ),
    );
  }
}
