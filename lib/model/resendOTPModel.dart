class ResendOTPModel {
  ResendOTPModel({
    required this.data,
  });
  late final List<Data> data;

  ResendOTPModel.fromJson(Map<String, dynamic> json){
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
    required this.msg,
    required this.success,
  });
  late final String msg;
  late final String success;

  Data.fromJson(Map<String, dynamic> json){
    msg = json['msg'];
    success = json['success'];
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['msg'] = msg;
  //   _data['success'] = success;
  //   return _data;
  // }
}
