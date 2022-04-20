import 'package:flutter/material.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'package:planet_news/app_constant/country_list.dart';
import 'package:planet_news/app_constant/string_const.dart';
import 'package:planet_news/views/signin_screen.dart';
import 'package:planet_news/widgets/custom_button.dart';
import 'package:planet_news/widgets/custom_input_field.dart';
import 'package:country_picker/country_picker.dart';
import 'package:planet_news/view_model/signup_view_model.dart';

import 'otp_screen.dart';
import 'package:provider/provider.dart';



class SignupScreen extends StatelessWidget {
  static const String id = 'SignUpScreen';
  var genderList = [
    "Male",
    "Female",

  ];


  var countryList = [
    'Male',
    'Female',

    "Algeria",
    "American",
"Andorra",
"Angola",
"Anguilla",
"Antarctica",
"Antigua and Barbuda",
"Argentina",
"Armenia",
"Aruba",
"Australia",
"Austria",
"Azerbaijan",
"Bahamas (the)",
"Bahrain",
"Bangladesh",
"Barbados",
"Belarus",
"Belgium",
"Belize",
"Benin",
"Bermuda",
"Bhutan",
"Bolivia (Plurinational State of)",
"Bonaire, Sint Eustatius and Saba",
"Bosnia and Herzegovina",
"Botswana",
"Bouvet Island",
"Brazil",
"British Indian Ocean Territory (the)",
"Brunei Darussalam",
"Bulgaria",
"Burkina Faso",
"Burundi",
"Cabo Verde",
"Cambodia",
"Cameroon",
"Canada",
"Cayman Islands (the)",
"Central African Republic (the)",
"Chad",
"Chile",
"China",
"Christmas Island",
"Cocos (Keeling) Islands (the)",
"Colombia",
"Comoros (the)",
"Congo (the Democratic Republic of the)",
"Congo (the)",
"Cook Islands (the)",
"Costa Rica",
"Croatia",
"Cuba",
"Curaçao",
"Cyprus",
"Czechia",
"Côte d'Ivoire",
"Denmark",
"Djibouti",
"Dominica",
"Dominican Republic (the)",
"Ecuador",
"Egypt",
"El Salvador",
"Equatorial Guinea",
"Eritrea",
"Estonia",
"Eswatini",
"Ethiopia",
"Falkland Islands (the) [Malvinas]",
"Faroe Islands (the)",
"Fiji",
"Finland",
"France",
"French Guiana",
"French Polynesia",
"French Southern Territories (the)",
"Gabon",
"Gambia (the)",
"Georgia",
"Germany",
"Ghana",
"Gibraltar",
"Greece",
"Greenland",
"Grenada",
"Guadeloupe",
"Guam",
"Guatemala",
"Guernsey",
"Guinea",
"Guinea-Bissau",
"Guyana",
"Haiti",
"Heard Island and McDonald Islands",
"Holy See (the)",
"Honduras",
"Hong Kong",
"Hungary",
"Iceland",
"India",
"Indonesia",
"Iran (Islamic Republic of)",
"Iraq",
"Ireland",
"Isle of Man",
"Israel",
"Italy",
"Jamaica",
"Japan",
"Jersey",
"Jordan",
"Kazakhstan",
"Kenya",
"Kiribati",
"Korea (the Democratic People's Republic of)",
"Korea (the Republic of)",
"Kuwait",
"Kyrgyzstan",
"Lao People's Democratic Republic (the)",
"Latvia",
"Lebanon",
"Lesotho",
"Liberia",
"Libya",
"Liechtenstein",
"Lithuania",
"Luxembourg",
"Macao",
"Madagascar",
"Malawi",
"Malaysia",
"Maldives",
"Mali",
"Malta",
"Marshall Islands (the)",
"Martinique",
"Mauritania",
"Mauritius",
"Mayotte",
"Mexico",
"Micronesia (Federated States of)",
"Moldova (the Republic of)",
"Monaco",
"Mongolia",
"Montenegro",
"Montserrat",
"Morocco",
"Mozambique",
"Myanmar",
"Namibia",
"Nauru",
"Nepal",
"Netherlands (the)",
"New Caledonia",
"New Zealand",
"Nicaragua",
"Niger (the)",
"Nigeria",
"Niue",
"Norfolk Island",
"Northern Mariana Islands (the)",
"Norway",
"Oman",
"Pakistan",
"Palau",
"Palestine, State of",
"Panama",
"Papua New Guinea",
"Paraguay",
"Peru",
"Philippines (the)",
"Pitcairn",
"Poland",
"Portugal",
"Puerto Rico",
"Qatar",
"Republic of North Macedonia",
"Romania",
"Russian Federation (the)",
"Rwanda",
"Réunion",
"Saint Barthélemy",
"Saint Helena, Ascension and Tristan da Cunha",
"Saint Kitts and Nevis",
"Saint Lucia",
"Saint Martin (French part)",
"Saint Pierre and Miquelon",
"Saint Vincent and the Grenadines",
"Samoa",
"San Marino",
"Sao Tome and Principe",
"Saudi Arabia",
"Senegal",
"Serbia",
"Seychelles",
"Sierra Leone",
"Singapore",
"Sint Maarten (Dutch part)",
"Slovakia",
"Slovenia",
"Solomon Islands",
"Somalia",
"South Africa",
"South Georgia and the South Sandwich Islands",
"South Sudan",
"Spain",
"Sri Lanka",
"Sudan (the)",
"Suriname",
"Svalbard and Jan Mayen",
"Sweden",
"Switzerland",
"Syrian Arab Republic",
"Taiwan",
"Tajikistan",
"Tanzania, United Republic of",
"Thailand",
"Timor-Leste",
"Togo",
"Tokelau",
"Tonga",
"Trinidad and Tobago",
"Tunisia",
"Turkey",
"Turkmenistan",
"Turks and Caicos Islands (the)",
"Tuvalu",
"Uganda",
"Ukraine",
"United Arab Emirates (the)",
"United Kingdom of Great Britain and Northern Ireland (the)",
"United States Minor Outlying Islands (the)",
"United States of America (the)",
"Uruguay",
"Uzbekistan",
"Vanuatu",
"Venezuela (Bolivarian Republic of)",
"Viet Nam",
"Virgin Islands (British)",
"Virgin Islands (U.S.)",
"Wallis and Futuna",
"Western Sahara",
"Yemen",
"Zambia",
"Zimbabwe",

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConst.screen_bg,
        body: SingleChildScrollView(
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
                              secureText: true,
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
                                value: countryvalue,
                                items: countryList.map((String items){
                                  return DropdownMenuItem(child: new Container(
                                    child :Text(
                                        items.length>10?'${items.substring(0,10)}...'
                                        :items
                                    ),
                                    // width:MediaQuery.of(context).size.width*0.2,
                                  ),value: items,);
                                }).toList(),
                                onChanged: (String? value){
                                  print(value);
                                  countryvalue = value!;
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
                              child: Expanded(
                                child: DropdownButton(
                                  value: dropdownvalue,
                                  items: genderList.map((String items){
                                    return DropdownMenuItem(child: Text(items),value: items,);
                                  }).toList(),
                                  onChanged: (String? value){
                                    dropdownvalue = value!;
                                  },
                                ),
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
                      email = txtFnameController.value.text.toString().trim();
                      password = txtpasswordController.value.text.toString().trim();
                      fname = txtFnameController.value.text.toString().trim();
                      lname = txtlnameController.value.text.toString().trim();

                      fullName = fname + " " + lname;

                      print(fullName);

                      var SignUpData = await Provider.of<SignupViewModel>(context,listen: false).registerUser
                        (fullName, email, password);


                      Navigator.pushNamed(context, OptContainer.id);
                    }, btnText: "SIGN UP"),
                    SizedBox(height: 15,),
                    Text("or Sign Up with", style: TextStyle(fontSize: 16, fontFamily: "Montserrat", fontWeight: FontWeight.w700),),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40,
                          child: Image.asset("assets/fb_logo.png"),
                        ),
                        Container(
                          height: 40,
                          child: Image.asset("assets/gmail_logo.png"),
                        ),
                      ],
                    ),


                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.center,
                child: Text("Already have an account ?", style: TextStyle(fontSize: 14, fontFamily: "Montserrat", fontWeight: FontWeight.w600),),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: SimpleButton(onPressed: (){


                  Navigator.pushNamed(context, SignInScreen.id);
                }, btnText: "LOGIN"),
              )
            ],
          ),
        )
    );
  }
}
