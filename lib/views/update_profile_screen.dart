import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:planet_news/app_constant/ui_constant.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/singleton/singletonConsts.dart';
import 'package:planet_news/view_model/updateProfileViewModel.dart';
import 'package:planet_news/views/splash_screen.dart';
import 'package:planet_news/widgets/full_screen_loader.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_constant/string_const.dart';
import '../model/countries_list_model.dart';
import '../view_model/countriesList_view_model.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/customFormTextField.dart';
import 'bottom_bar.dart';
import 'package:planet_news/view_model/userProfileViewModel.dart';



class EditUIScreen extends StatefulWidget {
  static const String id = 'editprofile';
  var genderList = [
    "Male",
    "Female",
  ];


  @override
  _EditUIScreenState createState() => _EditUIScreenState();
}

class _EditUIScreenState extends State<EditUIScreen> {
  // String dropdownvalue="Male";
  // String countryvalue = "Pakistan";

  String Gendervalue ="";
  String countryvalue =  "";



  String CountryID = '';

  String GenderValue =  "";
  String CountryName = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<UserProfileViewModel>(context,listen: false).getUserProfile(Singleton.UserID);
      Provider.of<CountriesListViewModel>(context, listen: false)
              .getAllCountries();

    });

  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //
  //   WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
  //
  //     Provider.of<UserProfileViewModel>(context,listen: false).getUserProfile(Singleton.UserID);
  //     Singleton.UserGender = Provider.of<UserProfileViewModel>(context,listen: false).getprofileModel.data[0].gender;
  //     Singleton.CountryVal = Provider.of<UserProfileViewModel>(context,listen: false).getprofileModel.data[0].countryName;
  //     print("Country: ${Singleton.CountryVal}");
  //     print(Singleton.UserGender);
  //
  //
  //     // Singleton.UserGender = Provider.of<UserProfileViewModel>(context,listen: false).getUserGender;
  //     // Singleton.CountryVal = Provider.of<UserProfileViewModel>(context,listen: false).getCountryName;
  //   });
  //   countryvalue = Singleton.CountryVal;
  //   Gendervalue = Singleton.UserGender;
  //
  // }

  @override
  Widget build(BuildContext context) {
    CountriesListViewModel _countriesViewModel = Provider.of<
        CountriesListViewModel>(context);
    UpdateProfileViewModel _updateModel = Provider.of<UpdateProfileViewModel>(
        context);
    UserProfileViewModel _userProfile = Provider.of<UserProfileViewModel>(context);



    // Singleton.UserGender =  _userProfile.getUserGender;
    //
    // String CountryName = _userProfile.getCountryName;




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



    // GenderValue =  _userProfile.getUserGender;
    // CountryName = _userProfile.getCountryName;

    // Singleton.CountryVal = _userProfile.getCountryName;






    return _countriesViewModel.getAppStatus == AppStatus.LOADING || _userProfile.getappStatus == AppStatus.LOADING
        ? FullScreenLoader()
        : Scaffold(
      appBar: AppBar(
        title: Text("Edit Your Profile"),
        // leading: Icon(
        //   Icons.arrow_back,
        //   color: Colors.white,
        // ),
      ),
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
              buildTextField("Full Name", "ABC123", false, fnameController),
              buildTextField("Last Name", "ABC123", false, lnameController),
              buildTextField("Email", "ABC@abc.com", false, emailController),
              buildTextField("New Password", "***********", true, passwordController),
              buildPhoneField("Phone Number", "03211234567",false,phNumberController),

              // Container(
              //   // decoration: StringConst.textFieldContainerDec,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 10.0),
              //     child: InternationalPhoneNumberInput(
              //         textFieldController: phNumberController,
              //         errorMessage: "Please Enter Valid Phone Number",
              //         locale: "Pakistan",
              //
              //         // inputBorder: InputBorder.none,
              //         autoFocusSearch: true,
              //         // inputDecoration: InputDecoration(
              //         //   contentPadding: EdgeInsets.only(bottom: 15,left: 0),
              //         // ),
              //         selectorConfig: SelectorConfig(
              //           selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              //         ),
              //
              //         onInputChanged: (PhoneNumber phNumber) {
              //           String? Number;
              //           Number = phNumber.phoneNumber;
              //           print(phNumber.phoneNumber);
              //         }
              //
              //
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.only(left: 15),
                        height: 45,
                        // decoration: StringConst.textFieldContainerDec,
                        child: DropdownButton(
                          isExpanded: true,
                          value: Singleton.CountryVal,
                          items: _countriesViewModel.countryList.map((
                              CountryData items) {
                            return DropdownMenuItem(child: Text(
                              items.nicename.length > 10 ? '${items.nicename
                                  .substring(0, 10)}...'
                                  : items.nicename,

                              // items.length>10?'${items.substring(0,10)}...'
                              // :items
                            ), value: items.nicename,);
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              countryvalue = value!;
                              print(countryvalue);
                              Singleton.CountryVal = value;
                              print(Singleton.CountryVal);

                              _countriesViewModel.countryList.forEach((element) {
                                if(element.nicename == value){
                                  print("CountryID");
                                }
                                CountryID = element.nicename;
                              });


                            });
                          },
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
                        // decoration: StringConst.textFieldContainerDec,
                        child: DropdownButton(
                          isExpanded: true,
                          value: Singleton.tempGenderVal,
                          items: widget.genderList.map((String items) {
                            return DropdownMenuItem(
                              child: Text(items), value: items,);
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              Gendervalue = value!;
                              Singleton.tempGenderVal = value;
                              print(Gendervalue);
                            });
                          },
                        ),
                      ),
                      //child: SimpleInputField(labelText: "First Name", secureText: false, inputType: TextInputType.text, inputAction: TextInputAction.next,),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text("CANCEL",
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.black,
                        ),),
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      print("User Name"+fnameController.value.text.toString().trim());
                      print(lnameController.value.text.toString().trim());
                      print(emailController.value.text.toString().trim());
                      print(passwordController.value.text.toString().trim());
                      print(phNumberController.value.text.toString().trim());

                      String fullName = fnameController.value.text.toString()
                          .trim() + " " +
                          lnameController.value.text.toString().trim();
                      await _updateModel.updateProfile(
                          fullName,
                          emailController.value.text.toString().trim(),
                          passwordController.value.text.toString().trim(),
                          phNumberController.value.text.toString().trim(),
                          Singleton.tempGenderVal,
                          Singleton.UserID,CountryID);

                      if(_updateModel.getUpdateProfileModel?.data[0].success == "1")
                        {
                          print("Ok hogya");
                          showSnackBar(context: context, message: "Your Profile has been Updated");
                          print(_updateModel.getResMsg);
                          print("Ok hogya");
                          fullName = fnameController.value.text.toString()
                              .trim() + " " +
                              lnameController.value.text.toString().trim();
                          print("${Singleton.UserName}");
                          final SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                          sharedPreferences.remove("UserNameKey");
                          sharedPreferences.setString("UserNameKey", fullName);
                          print("Name Updated");
                          print("Updated Name: " + fullName);

                          showDialog(context: context, builder: (context)=>AlertDialog(
                            title: Text("Your Profile has been Updated 😊"),
                            content: Text("Do you Want to Continue? "),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pushReplacementNamed(context, BottomBar.id);
                              }, child: Text("YES")),
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text("NO"))
                            ],
                            elevation: 1,

                          ),
                            barrierDismissible: false,

                          );


                        }


                      print("Profile Update");

                      if (_updateModel.getsuccessMsg == "1") {
                        // _updateModel.getUpdateProfileModel?.data[0].msg;

                        showSnackBar(context: context, message: _updateModel
                            .getUpdateProfileModel!.data[0].msg);
                        print("Updated");
                        print(Singleton.UserID);
                      }
                    },
                    child: Text("SAVE", style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}