import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


class PrivacyPolicyModel {
  PrivacyPolicyModel({
    required this.appPrivacyPolicy,
  });
  late final String appPrivacyPolicy;

  PrivacyPolicyModel.fromJson(Map<String, dynamic> json){
    appPrivacyPolicy = json['app_privacy_policy'];
  }



  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['app_privacy_policy'] = appPrivacyPolicy;
  //   return _data;
  // }
}