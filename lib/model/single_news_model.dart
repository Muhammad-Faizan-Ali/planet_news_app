class SingleNewsModel {
  SingleNewsModel({
    required this.data,
  });
  late final List<SingleNewsData> data;

  SingleNewsModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>SingleNewsData.fromJson(e)).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['data'] = data.map((e)=>e.toJson()).toList();
  //   return _data;
  // }
}

class SingleNewsData {
  SingleNewsData({
    required this.cid,
    required this.categoryName,
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
    required this.isFavourite,
    required this.galleyImage,
    this.relatedNews,
    required this.userComments,
  });
  late final String cid;
  late final String categoryName;
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
  late final String isFavourite;
  late final List<String> galleyImage;
  late final Null relatedNews;
  late final List<String> userComments;

  SingleNewsData.fromJson(Map<String, dynamic> json){
    cid = json['cid'];
    categoryName = json['category_name'];
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
    isFavourite = json['is_favourite'];
    galleyImage = List.castFrom<dynamic, String>(json['galley_image']);
    relatedNews = null;
    userComments = List.castFrom<dynamic, String>(json['user_comments']);
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['cid'] = cid;
  //   _data['category_name'] = categoryName;
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
  //   _data['is_favourite'] = isFavourite;
  //   _data['galley_image'] = galleyImage;
  //   _data['related_news'] = relatedNews;
  //   _data['user_comments'] = userComments;
  //   return _data;
  // }
}