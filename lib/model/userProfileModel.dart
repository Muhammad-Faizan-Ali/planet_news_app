class AutoGenerate {
  AutoGenerate({
    required this.data,
  });
  late final List<LoginUserData> data;

  AutoGenerate.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>LoginUserData.fromJson(e)).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['data'] = data.map((e)=>e.toJson()).toList();
  //   return _data;
  // }
}

class LoginUserData {
  LoginUserData({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.countryName,
    required this.countryCode,
    required this.success,
  });
  late final String userId;
  late final String name;
  late final String email;
  late final String phone;
  late final String gender;
  late final String countryName;
  late final String countryCode;
  late final String success;

  LoginUserData.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    countryName = json['country_name'];
    countryCode = json['country_code'];
    success = json['success'];
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['user_id'] = userId;
  //   _data['name'] = name;
  //   _data['email'] = email;
  //   _data['phone'] = phone;
  //   _data['gender'] = gender;
  //   _data['country_name'] = countryName;
  //   _data['country_code'] = countryCode;
  //   _data['success'] = success;
  //   return _data;
  // }
}