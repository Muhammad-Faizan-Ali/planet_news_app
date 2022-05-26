class SigninModel {
  SigninModel({
    required this.data,
  });
  late final List<Data> data;

  SigninModel.fromJson(Map<String, dynamic> json){
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
    required this.confirmed,
    required this.msg,
    required this.authId,
    required this.success,
  });
  late final String userId;
  late final String name;
  late final String email;
  late final String confirmed;
  late final String msg;
  late final String authId;
  late final String success;

  Data.fromJson(Map<String, dynamic> json){
    userId = json['user_id'] == null ? "" : json['user_id'];
    name = json['name'] == null ? "" : json['name'];
    email = json['email'] == null ? "" : json['email'];
    confirmed = json['confirmed'];
    msg = json['msg'];
    authId = json['auth_id'] == null ? "" : json['auth_id'];
    success = json['success'];
  }
}