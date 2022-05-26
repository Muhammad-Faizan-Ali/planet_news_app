class CommentModel {
  List<Data>? data;

  CommentModel({this.data});

  CommentModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Data {
  String? msg;
  String? success;

  Data({this.msg, this.success});

  Data.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    success = json['success'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['msg'] = this.msg;
  //   data['success'] = this.success;
  //   return data;
  // }
}