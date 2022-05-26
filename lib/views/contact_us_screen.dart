



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'package:planet_news/app_constant/ui_constant.dart';
import 'package:planet_news/view_model/userNewsViewModel.dart';

import 'package:planet_news/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import '../singleton/singletonConsts.dart';
import '../widgets/customFormTextField.dart';
import 'news_home_page_screen.dart';
import 'dart:async';
import 'dart:io';

class Contact extends StatefulWidget {
  static String id = 'contact';

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TextEditingController NewsTitleController = new TextEditingController();
  TextEditingController NewsDesController = new TextEditingController();
  TextEditingController URLController = new TextEditingController();
  var selectedImage;


  void keepfocus(){
    print(NewsTitleController.text);
  }
  @override
  void initState() {
    // TODO: implement initState
    NewsTitleController.addListener(keepfocus);
    NewsDesController.addListener(keepfocus);
    super.initState();
  }

  final _formKeyTitle = GlobalKey<FormState>();
  final _formKeyDes = GlobalKey<FormState>();

  var _selectedValue = 1;
  var imageName;

  var FinalImageFromCam;
  var FinalImageFromGal;
  // Widget getImageWidget(){
  //   if(selectedImage !=null)
  //   {
  //     return Image.file(
  //       selectedImage!,
  //       width: 250,
  //       height: 250,
  //       fit: BoxFit.fill,
  //     );
  //   }
  //   else{
  //     return Text("");
  //   }
  // }

  @override
  Widget build(BuildContext context) {


    UserNewsViewModel _userViewModel = Provider.of<UserNewsViewModel>(context);

    return Scaffold(

      backgroundColor: ColorConst.screen_bg,
      appBar: AppBar(
        title: Text(""),
        backgroundColor: ColorConst.home_page_container,
        elevation: 0,

        // actions: [
        //   Padding(
        //     padding: EdgeInsets.only(right: 20.0),
        //     child: Icon(Icons.person),
        //   ),
        // ],
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
                                'assets/news.png',
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
              Form(
                  key: _formKeyTitle,
                  child: buildTextField("News Title", "ABC123", false, NewsTitleController)
              ),
              Form(
                  key: _formKeyDes,
                  child: buildTextArea("News Description","Enter Description",false,NewsDesController)
              ),
              // buildTextField("Last Name", "ABC123", false, lnameController),
              // buildTextField("Email", "ABC@abc.com", false, emailController),
              // buildTextField(
              //     "New Password", "***********", true, passwordController),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Radio<int>(
                          value: 1,
                          groupValue: _selectedValue,
                          onChanged: (value){
                            setState(() {
                              _selectedValue = 1;
                              print(_selectedValue);
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text("Post As Image",style: TextStyle(fontSize: 16),),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Radio<int>(
                          value: 2,
                          groupValue: _selectedValue,
                          onChanged: (value){
                            setState(() {
                              _selectedValue = 2;
                              print(_selectedValue);
                            });
                          },
                        ),
                      ),
                      Text("Upload From Gallery",style: TextStyle(fontSize: 16),),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Radio<int>(
                          value: 3,
                          groupValue: _selectedValue,
                          onChanged: (value){
                            setState(() {
                              _selectedValue = 3;
                              print(_selectedValue);
                            });
                          },
                        ),
                      ),
                      Text("Post Youtube Video URL",style: TextStyle(fontSize: 16),),
                    ],
                  ),

                  SizedBox(width: 5,),
                  // Text("Radio 2"),
                ],
              ),
              SizedBox(height: 10,),

              Column(
                children: <Widget>[
                  _selectedValue == 1?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(onPressed: ()async{
                        print("Pick From Camera");
                        imageName = await _userViewModel.getImageFromPhone(ImageSource.camera);

                        setState(() {
                          FinalImageFromCam = imageName;
                        });

                        print(_userViewModel.getSelectedImage);
                        print("Image Has been Taken");

                        print("Image NAme: ${imageName}");

                      },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 9),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.camera_enhance,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text("Pick From Camera",style: TextStyle(fontSize: 14),),
                              ],
                            ),
                          )
                      ),

                      FinalImageFromCam == null? Text("No Image Taken",style: TextStyle(fontSize: 18),):
                      Flexible(child: Text("Image Uploaded",style: TextStyle(fontSize: 18),)),
                      // Text(imageName == ""? "No Image Taken" : imageName ),
                    ],
                  ):
                  _selectedValue == 2?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(onPressed: ()async{
                        print("Pick From Gallery");
                        // FocusScope.of(context).unfocus(disposition: UnfocusDisposition.scope);
                        imageName = await _userViewModel.getImageFromPhone(ImageSource.gallery);

                        setState(() {
                          FinalImageFromGal = imageName;
                        });
                      },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.orange)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 9),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.upload_outlined,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text("Pick From Gallery",style: TextStyle(fontSize: 14),),

                              ],
                            ),
                          )
                      ),
                      FinalImageFromGal == null? Text("No Image Taken",style: TextStyle(fontSize: 18),):
                      Flexible(child: Text("Image Uploaded",style: TextStyle(fontSize: 18)),),
                      // imageName == ""?
                      //     Text("No Image Taken"):
                      //     Text(imageName),
                      // Text(imageName == ""? "No Image Taken" : imageName ),
                    ],
                  ):
                  _selectedValue == 3?buildTextField("Video URL","Enter Video URL",false,URLController):Text("Invalud"),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
                    onPressed: () async{
                      print("Save");
                      if(_selectedValue == 1){
                        await _userViewModel.submitNewsImage(
                          _userViewModel.getbase64string,
                          NewsTitleController.value.text.toString().trim(),
                          NewsDesController.value.text.toString().trim(),
                          Singleton.UserID,
                        );
                      }
                      else if(_selectedValue == 2){
                        await _userViewModel.submitNewsImage(
                          _userViewModel.getbase64string,
                          NewsTitleController.value.text.toString().trim(),
                          NewsDesController.value.text.toString().trim(),
                          Singleton.UserID,
                        );
                      }

                      else if(_selectedValue == 3){
                        await _userViewModel.submitNewsVideo(
                          URLController.value.text.toString().trim(),
                          NewsTitleController.value.text.toString().trim(),
                          NewsDesController.value.text.toString().trim(),
                          Singleton.UserID,
                        );
                      }
                      else{
                        print("Invalid Choice");
                      }
                      if(_userViewModel.getSuccessMsg == "1"){
                        showSnackBar(context: context, message: "News Has Been Submitted");
                        print("News Has Been Submitted ${_userViewModel.getUserNewsModel.data[0].id}");
                      }

                    },
                    child: Text("SEND", style: TextStyle(
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
              ),

              // Container(
              //   width: 250,
              //   height: 250,
              //   child: selectedImage == null?
              //   Image.network("https://icon-library.com/images/image-placeholder-icon/image-placeholder-icon-5.jpg"):
              //   Image.file(selectedImage!),
              //
              // ),

            ],
          ),
        ),
      ),


    );
  }
}
