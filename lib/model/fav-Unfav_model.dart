class FavUnfavModel {
  FavUnfavModel({
    required this.status,
    required this.message,
    required this.msg,
    required this.success,
    required this.isFavourite,
  });
  late final String status;
  late final String message;
  late final String msg;
  late final int success;
  late final bool isFavourite;
  
  FavUnfavModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    msg = json['msg'];
    success = json['success'];
    isFavourite = json['is_favourite'];
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['status'] = status;
  //   _data['message'] = message;
  //   _data['msg'] = msg;
  //   _data['success'] = success;
  //   _data['is_favourite'] = isFavourite;
  //   return _data;
  // }
}