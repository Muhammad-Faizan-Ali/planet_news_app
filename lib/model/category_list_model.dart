class CategoryListModel {
  CategoryListModel({
    required this.data,
  });
  late final List<CategoryData> data;

  CategoryListModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>CategoryData.fromJson(e)).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['data'] = data.map((e)=>e.toJson()).toList();
  //   return _data;
  // }
}

class CategoryData {
  CategoryData({
    required this.cid,
    required this.categoryName,
    required this.categoryImage,
    required this.categoryImageThumb,
  });
  late final String cid;
  late final String categoryName;
  late final String categoryImage;
  late final String categoryImageThumb;

  CategoryData.fromJson(Map<String, dynamic> json){
    cid = json['cid'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
    categoryImageThumb = json['category_image_thumb'];
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['cid'] = cid;
  //   _data['category_name'] = categoryName;
  //   _data['category_image'] = categoryImage;
  //   _data['category_image_thumb'] = categoryImageThumb;
  //   return _data;
  // }
}