// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'package:planet_news/app_constant/country_list.dart';
import 'package:planet_news/app_constant/string_const.dart';
import 'package:planet_news/app_constant/ui_constant.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/model/countries_list_model.dart';
import 'package:planet_news/singleton/singletonConsts.dart';
import 'package:planet_news/view_model/countriesList_view_model.dart';
import 'package:planet_news/views/signin_screen.dart';
import 'package:planet_news/widgets/custom_button.dart';
import 'package:planet_news/widgets/custom_input_field.dart';
import 'package:country_picker/country_picker.dart';
import 'package:planet_news/view_model/signup_view_model.dart';
import 'package:planet_news/widgets/full_screen_loader.dart';

import 'Social_signup_view.dart';
import 'otp_screen.dart';
import 'package:provider/provider.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';



class SignupScreen extends StatefulWidget {
  static const String id = 'SignUpScreen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  var genderList = [
    "Male",
    "Female",

  ];
  //Facebook Variables
  Map<String,dynamic>? userData;
  bool checking = true;
  AccessToken? _accessToken;

  String dropdownvalue="Male";

  String countryvalue = "Pakistan";

  late String email;

  late String password;

  late String fname;

  late String lname;

  late String fullName;

  late String ConPassword;

  TextEditingController txtFnameController = new TextEditingController();

  TextEditingController txtlnameController = new TextEditingController();

  TextEditingController txtemailController = new TextEditingController();

  TextEditingController txtpasswordController = new TextEditingController();

  TextEditingController txtConPassController = new TextEditingController();

  TextEditingController phoneNumberController = new TextEditingController();
  List<String> countriesList=[];
  String? Useremail;
  String? DisplayName;
  String CountryID="";




  @override
  void initState() {

    super.initState();


    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<CountriesListViewModel>(context, listen: false).getAllCountries();
    });

    // checkifLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    // CountriesModel country_model = Provider.of<CountriesModel>(context);
    SignupViewModel _signupViewModel = Provider.of<SignupViewModel>(context);
    CountriesListViewModel _countriesViewModel = Provider.of<CountriesListViewModel>(context);

    return Scaffold(
        backgroundColor: ColorConst.screen_bg,
        body: (_countriesViewModel.getAppStatus == AppStatus.LOADING || _signupViewModel.getAppStatus == AppStatus.LOADING) ? FullScreenLoader() : SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 260,
                alignment: Alignment.center,
                child: Image.asset("assets/app_logo.png"),
              ),
              Container(
                width: double.infinity,
                // height: 380,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 30),
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
                    Row(
                      children: [
                        Expanded(
                          child: SimpleInputField(
                            txtController: txtFnameController,
                            labelText: "First Name",
                            secureText: false,
                            inputType: TextInputType.text,
                            inputAction: TextInputAction.next,
                            onChanged: (value)
                            {

                            },
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: SimpleInputField(
                              labelText: "Last Name",
                              txtController: txtlnameController,
                              secureText: false,
                              inputType: TextInputType.text,
                              inputAction: TextInputAction.next,
                            onChanged: (value){

                            },
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 20,),
                    SimpleInputField(
                        labelText: "Enter Your Email",
                        secureText: false, inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                        txtController: txtemailController,
                      onChanged: (value){

                      },

                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            height: 45,
                            decoration: StringConst.textFieldContainerDec,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                value: countryvalue,
                                items: _countriesViewModel.countryList.map((CountryData items){
                                  return DropdownMenuItem(child: Text(
                                    items.nicename.length>10?'${items.nicename.substring(0,10)}...'
                                        :items.nicename,

                                      // items.length>10?'${items.substring(0,10)}...'
                                      // :items
                                  ), value: items.nicename,);
                                }).toList(),
                                onChanged: (String? value){
                                  setState(() {

                                    countryvalue = value!;

                                    _countriesViewModel.countryList.forEach((element) {
                                      if(element.nicename == value){
                                       print("Country Name: ${element.nicename}");
                                       print("CountryID: ${element.id}");
                                       CountryID = element.id;


                                      }
                                    });

                                    print(countryvalue);

                                  });

                                },
                              ),
                            ),
                          ),
                          //child: SimpleInputField(labelText: "First Name", secureText: false, inputType: TextInputType.text, inputAction: TextInputAction.next,),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 15),
                            height: 45,
                            decoration: StringConst.textFieldContainerDec,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                value: dropdownvalue,
                                items: genderList.map((String items){
                                  return DropdownMenuItem(child: Text(items),value: items,);
                                }).toList(),
                                onChanged: (String? value){
                                  setState(() {
                                    dropdownvalue = value!;
                                    print(dropdownvalue);
                                  });
                                },
                              ),
                            ),
                          ),
                          //child: SimpleInputField(labelText: "First Name", secureText: false, inputType: TextInputType.text, inputAction: TextInputAction.next,),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: StringConst.textFieldContainerDec,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: InternationalPhoneNumberInput(
                          textFieldController: phoneNumberController,
                          errorMessage: "Please Enter Valid Phone Number",
                          inputBorder: InputBorder.none,
                          autoFocusSearch: true,
                          // inputDecoration: InputDecoration(
                          //   contentPadding: EdgeInsets.only(bottom: 15,left: 0),
                          // ),
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          onInputChanged: (PhoneNumber phNumber)
                          {
                            String? Number;
                            Number = phNumber.phoneNumber;
                            
                            print(phNumber.phoneNumber);
                          }
                          ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                          child: SimpleInputField(
                            labelText: "Password",
                            txtController: txtpasswordController,
                            secureText: true,
                            inputType: TextInputType.text,
                            inputAction: TextInputAction.next,
                            onChanged: (value){

                            },
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: SimpleInputField(
                              txtController: txtConPassController,
                              labelText: "Confirm Password",
                              secureText: true,
                              inputType: TextInputType.text,
                              inputAction: TextInputAction.next,
                            onChanged: (value){},
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 20,),

                    SimpleButton(onPressed: ()async{
                      email = txtemailController.value.text.toString().trim();
                      password = txtpasswordController.value.text.toString().trim();
                      fname = txtFnameController.value.text.toString().trim();
                      lname = txtlnameController.value.text.toString().trim();
                      ConPassword = txtConPassController.value.text.toString().trim();
                      fullName = fname + " " + lname;

                      print("FullName:  $fullName");
                      print("Email:  $email");
                      print("Password: $password");

                      if(password !="" && ConPassword !="" &&email !="" && fname !="" && lname !="")
                      {
                            if(password == ConPassword)
                          {
                              await Provider.of<SignupViewModel>(context,listen: false).registerUser
                                (fullName, email, password,phoneNumberController.value.text,dropdownvalue,"Normal","1",CountryID);

                                Singleton.userEmail = email;

                                String strMsg = _signupViewModel.registerMsg;
                                showSnackBar(context: context, message: strMsg, mColor: Colors.grey);

                                // showSnackBar(context: context, message: _signinViewModel.getSigninModel.data[0].name, mColor: Colors.grey);
                                print(_signupViewModel.getSignUpModel.data[0].msg);

                                Navigator.pushReplacementNamed(context, OptContainer.id);

                          }

                            else{
                                Fluttertoast.showToast(msg: "Your Password didn't Match");
                            }

                      }
                      else{
                        Fluttertoast.showToast(msg: "Please Fill Out All the Fields");
                      }

                      


                      

                      
                    }, btnText: "SIGN UP"),
                    SizedBox(height: 15,),
                    Text("or Sign Up with", style: TextStyle(fontSize: 16, fontFamily: "Montserrat", fontWeight: FontWeight.w700),),
                    SizedBox(height: 15,),
                    // Text(Useremail==null? '': Useremail.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         SocialButton(
                           logoPath: "assets/fb_logo.png",
                           onPressed: ()async{
                            print("Facebook Login");
                            await _signupViewModel.FacebookSignIn();
                            Navigator.push(context,
                                PageRouteBuilder(
                                    transitionDuration: Duration(milliseconds: 300),
                                    transitionsBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secAnimation,
                                        Widget child) {
                                      animation = CurvedAnimation(parent: animation, curve: Curves.easeInOutQuad);
                                      return FadeTransition(opacity: animation, child: child);
                                    },
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secAnimation) {
                                      return SocialSignUp(SignUpType: "Facebook");
                                    }));
                            },
                          ),

                          SocialButton(
                            logoPath: "assets/gmail_logo.png",
                           onPressed: ()async{
                            var googleUser = await GoogleSignIn().signIn();
                            print(googleUser!.displayName);
                            print(googleUser.email);
                            setState(() {
                              Singleton.SocialEmail = Useremail = googleUser.email;
                              DisplayName=googleUser.displayName;
                              Singleton.SocialAuthID = googleUser.id;
                              print(Singleton.SocialAuthID);
                            });

                            print(googleUser.id);
                            Navigator.push(context,
                                PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 300),
                                transitionsBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secAnimation,
                                    Widget child) {
                                  animation = CurvedAnimation(parent: animation, curve: Curves.easeInOutQuad);
                                  return FadeTransition(opacity: animation, child: child);
                                },
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secAnimation) {
                                  return SocialSignUp(SignUpType: "Google");
                                }));
                            },
                          ),
                            //Google Authentication
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.center,
                child: Text("Already have an account ?",
                  style: TextStyle(fontSize: 14, fontFamily: "Montserrat", fontWeight: FontWeight.w600),),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: SimpleButton(onPressed: (){
                  // print(_countriesViewModel.getCountriesList);
                  Navigator.pushNamed(context, SignInScreen.id);
                }, btnText: "LOGIN"),
              )
            ],
          ),
        )
    );
  }
}





class SocialButton extends StatelessWidget {
  SocialButton({required this.logoPath,required this.onPressed});
  String logoPath;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
          onPressed: onPressed,
          child: Container(
              height: 40,
              child: Image.asset(logoPath),
            ),
      );

   }
}