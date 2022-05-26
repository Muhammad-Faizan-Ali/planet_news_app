import 'package:flutter/material.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/view_model/privacy_policy_view_model.dart';
import 'package:planet_news/model/privacy_policy_model.dart';
import 'package:planet_news/widgets/full_screen_loader.dart';
import 'package:provider/provider.dart';
import 'news_home_page_screen.dart';
import 'package:intl/intl.dart';
class PrivacyPolicyView extends StatefulWidget {


  @override
  _PrivacyPolicyViewState createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  String privacyText='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<PrivacyPolicyViewModel>(context,listen: false).getPrivacyPolicy();
    });

  }
  @override
  Widget build(BuildContext context) {
    PrivacyPolicyViewModel _privacyModel = Provider.of<PrivacyPolicyViewModel>(context);
    privacyText = Bidi.stripHtmlIfNeeded(_privacyModel.getPrivacyText);
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        elevation: 0,
      ),
      body: _privacyModel.getAppStatus == AppStatus.LOADING? FullScreenLoader():Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Column(
                children: [
                  Text("Privacy Policy",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: ColorConst.btn_bg),),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      privacyText ,style: TextStyle(color: Colors.black,fontSize: 18),
                      textAlign: TextAlign.left,
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
