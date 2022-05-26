class UserNewsModel {
  UserNewsModel({
    required this.data,
  });
  late final List<Data> data;

  UserNewsModel.fromJson(Map<String, dynamic> json){
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
    required this.id,
    required this.success,
  });
  late final int id;
  late final String success;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    success = json['success'];
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['id'] = id;
  //   _data['success'] = success;
  //   return _data;
  // }
}