import 'package:flutter/material.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'package:planet_news/app_constant/country_list.dart';
import 'package:planet_news/app_constant/string_const.dart';
import 'package:planet_news/app_constant/ui_constant.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/model/countries_list_model.dart';
import 'package:planet_news/view_model/countriesList_view_model.dart';
import 'package:planet_news/views/signin_screen.dart';
import 'package:planet_news/widgets/custom_button.dart';
import 'package:planet_news/widgets/custom_input_field.dart';
import 'package:country_picker/country_picker.dart';
import 'package:planet_news/view_model/signup_view_model.dart';
import 'package:planet_news/widgets/full_screen_loader.dart';

import 'otp_screen.dart';
import 'package:provider/provider.dart';
// import 'package:auth_buttons/auth_buttons.dart' show GoogleAuthButton, AuthButtonStyle, AuthButtonType, AuthIconType;
import 'package:google_sign_in/google_sign_in.dart';


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

  String dropdownvalue="Male";

  String countryvalue = "Pakistan";

  late String email;

  late String password;

  late String fname;

  late String lname;

  late String fullName;

  TextEditingController txtFnameController = new TextEditingController();

  TextEditingController txtlnameController = new TextEditingController();

  TextEditingController txtemailController = new TextEditingController();

  TextEditingController txtpasswordController = new TextEditingController();
  List<String> countriesList=[];
  String? Useremail;
  String? DisplayName;

  Future<dynamic> getAllCountries()async
  {
    // var countries =
    // return countries;
  }
  void countrymethod()async
  {
    // var countries = await getAllCountries();
    // print(countries);
    // countriesList = await Provider.of<CountriesListViewModel>(
    //     context, listen: false).getAllCountries();
    // for (var i in countriesList){
    //   print("Country is: $i");
    //
    // }
  }



  @override
  void initState() {

    super.initState();
    //

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<CountriesListViewModel>(context, listen: false).getAllCountries();
    });
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
                            // txtController: txtFnameController..text = "Faizan",
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
                      txtController: txtemailController..text = "$Useremail",
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

                      fullName = fname + " " + lname;

                      print("Name: + $fullName");
                      print("Name: + $email");
                      print("Name: + $password");


                      await Provider.of<SignupViewModel>(context,listen: false).registerUser
                        (fullName, email, password,dropdownvalue,"03356727047");


                      String strMsg = _signupViewModel.registerMsg;
                      showSnackBar(context: context, message: strMsg, mColor: Colors.grey);

                      // showSnackBar(context: context, message: _signinViewModel.getSigninModel.data[0].name, mColor: Colors.grey);
                      print(_signupViewModel.getSignUpModel.data[0].msg);





                      Navigator.pushNamed(context, OptContainer.id);
                    }, btnText: "SIGN UP"),
                    SizedBox(height: 15,),
                    Text("or Sign Up with", style: TextStyle(fontSize: 16, fontFamily: "Montserrat", fontWeight: FontWeight.w700),),
                    SizedBox(height: 15,),
                    // Text(Useremail==null? '': Useremail.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {

                          },
                          child: Container(
                            height: 40,
                            child: Image.asset("assets/fb_logo.png"),
                          ),
                        ),

                        TextButton(
                          onPressed: ()async{
                            var googleUser = await GoogleSignIn().signIn();
                            print(googleUser!.displayName);
                            print(googleUser.email);
                            setState(() {
                              Useremail=googleUser.email;
                              DisplayName=googleUser.displayName;
                            });
                            print(googleUser.id);
                          },
                          child: Container(
                            height: 40,
                            child: Image.asset("assets/gmail_logo.png"),
                          ),
                        ),
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
