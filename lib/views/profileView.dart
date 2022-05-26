import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../enum/app_status.dart';
import '../model/countries_list_model.dart';
import '../singleton/singletonConsts.dart';
import '../view_model/countriesList_view_model.dart';
import '../view_model/userProfileViewModel.dart';

import '../widgets/full_screen_loader.dart';

import '../widgets/profileFields.dart';

class UserProfileScreen extends StatefulWidget {
  static String id = "userProfile";

  var genderList = [
    "Male",
    "Female",
  ];

  String dropdownvalue="Male";
  String countryvalue = "Pakistan";

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool isEnabled =  true;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<UserProfileViewModel>(context,listen: false).getUserProfile(Singleton.UserID);

    });
  }
  @override

  Widget build(BuildContext context) {
    CountriesListViewModel _countriesViewModel = Provider.of<
        CountriesListViewModel>(context);
    UserProfileViewModel _userProfile = Provider.of<UserProfileViewModel>(context);


    TextEditingController fnameController = new TextEditingController(
      text: _userProfile.getUserName,
    );
    TextEditingController lnameController = new TextEditingController();
    TextEditingController emailController = new TextEditingController(
      text: _userProfile.getUserEmail,
    );
    TextEditingController passwordController = new TextEditingController();
    TextEditingController phNumberController = new TextEditingController(
      text: _userProfile.getPhoneNumber,
    );

    String GenderValue =  _userProfile.getUserGender;
    String CountryName = _userProfile.getCountryName;

    return
      _userProfile.getappStatus == AppStatus.LOADING
        ? FullScreenLoader()
        :
    Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 10, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/male.png',
                              ))),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          color: Colors.blue,
                        ),
                        child: Icon(Icons.edit),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),

              buildTextField("Full Name", "ABC123", false, fnameController,false),
              buildTextField("Email", "ABC@abc.com", false, emailController,false),
              buildPhoneField("Phone Number", "03211234567",false,phNumberController,false),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
