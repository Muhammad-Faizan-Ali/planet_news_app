class UserProfileModel {
  UserProfileModel({
    required this.data,
  });
  late final List<Data> data;

  UserProfileModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['data'] = data.map((e)=>e.toJson()).toList();
  //   return _data;
  // }
}

class Data {
  Data({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.countryName,
    required this.success,
  });
  late final String userId;
  late final String name;
  late final String email;
  late final String phone;
  late final String gender;
  late final String countryName;
  late final String success;

  Data.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    countryName = json['country_name'];
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
  //   _data['success'] = success;
  //   return _data;
  // }
}