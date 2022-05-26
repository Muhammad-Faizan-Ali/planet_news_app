class NewsListByCatIDModel {
  NewsListByCatIDModel({
    required this.data,
  });
  late final List<NewsbyCatIDList> data;

  NewsListByCatIDModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>NewsbyCatIDList.fromJson(e)).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['data'] = data.map((e)=>e.toJson()).toList();
  //   return _data;
  // }
}

class NewsbyCatIDList {
  NewsbyCatIDList({
    required this.id,
    required this.catId,
    required this.newsType,
    required this.newsTitle,
    required this.videoUrl,
    required this.videoId,
    required this.newsImageB,
    required this.newsImageS,
    required this.newsDescription,
    required this.newsDate,
    required this.newsViews,
    required this.cid,
    required this.categoryName,
    required this.categoryImage,
    required this.categoryImageThumb,
    required this.isFavourite,
  });
  late final String id;
  late final String catId;
  late final String newsType;
  late final String newsTitle;
  late final String videoUrl;
  late final String videoId;
  late final String newsImageB;
  late final String newsImageS;
  late final String newsDescription;
  late final String newsDate;
  late final String newsViews;
  late final String cid;
  late final String categoryName;
  late final String categoryImage;
  late final String categoryImageThumb;
  late final String isFavourite;

  NewsbyCatIDList.fromJson(Map<String, dynamic> json){
    id = json['id'];
    catId = json['cat_id'];
    newsType = json['news_type'];
    newsTitle = json['news_title'];
    videoUrl = json['video_url'];
    videoId = json['video_id'];
    newsImageB = json['news_image_b'];
    newsImageS = json['news_image_s'];
    newsDescription = json['news_description'];
    newsDate = json['news_date'];
    newsViews = json['news_views'];
    cid = json['cid'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
    categoryImageThumb = json['category_image_thumb'];
    isFavourite = json['is_favourite'];
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['id'] = id;
  //   _data['cat_id'] = catId;
  //   _data['news_type'] = newsType;
  //   _data['news_title'] = newsTitle;
  //   _data['video_url'] = videoUrl;
  //   _data['video_id'] = videoId;
  //   _data['news_image_b'] = newsImageB;
  //   _data['news_image_s'] = newsImageS;
  //   _data['news_description'] = newsDescription;
  //   _data['news_date'] = newsDate;
  //   _data['news_views'] = newsViews;
  //   _data['cid'] = cid;
  //   _data['category_name'] = categoryName;
  //   _data['category_image'] = categoryImage;
  //   _data['category_image_thumb'] = categoryImageThumb;
  //   _data['is_favourite'] = isFavourite;
  //   return _data;
  // }
}