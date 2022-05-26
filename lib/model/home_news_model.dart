class HomeNewsModel {
  HomeNewsModel({
    required this.data,
  });
  late final Data data;

  HomeNewsModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['data'] = data.toJson();
  //   return _data;
  // }
}

class Data {
  Data({
    required this.featuredNews,
    required this.top_10News,
    required this.latestNews,
    required this.categoryList,
  });
  late final List<FeaturedNews> featuredNews;
  late final List<Top_10News> top_10News;
  late final List<LatestNews> latestNews;
  late final List<CategoryList> categoryList;

  Data.fromJson(Map<String, dynamic> json){
    featuredNews = List.from(json['featured_news']).map((e)=>FeaturedNews.fromJson(e)).toList();
    top_10News = List.from(json['top_10_news']).map((e)=>Top_10News.fromJson(e)).toList();
    latestNews = List.from(json['latest_news']).map((e)=>LatestNews.fromJson(e)).toList();
    categoryList = List.from(json['category_list']).map((e)=>CategoryList.fromJson(e)).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['featured_news'] = featuredNews.map((e)=>e.toJson()).toList();
  //   _data['top_10_news'] = top_10News.map((e)=>e.toJson()).toList();
  //   _data['latest_news'] = latestNews.map((e)=>e.toJson()).toList();
  //   _data['category_list'] = categoryList.map((e)=>e.toJson()).toList();
  //   return _data;
  // }
}

class FeaturedNews {
  FeaturedNews({
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

  FeaturedNews.fromJson(Map<String, dynamic> json){
    id = json['id'];
    catId = json['cat_id'] == null? " " : json['cat_id'];
    newsType = json['news_type'] == null? " " : json['news_type'];
    newsTitle = json['news_title'] == null? " ": json['news_title'];
    videoUrl = json['video_url'] == null? " " : json['video_url'];
    videoId = json['video_id'] == null? " " : json['video_id'];
    newsImageB = json['news_image_b'] == null? " " : json['news_image_b'];
    newsImageS = json['news_image_s'] == null? " " : json['news_image_s'];
    newsDescription = json['news_description'] == null? " " : json['news_description'];
    newsDate = json['news_date'] == null? " " : json['news_date'];
    newsViews = json['news_views'] == null? " " : json['news_views'];
    cid = json['cid'] == null ? " " : json['cid'];
    categoryName = json['category_name'] == null? " " :json['category_name'];
    categoryImage = json['category_image'] == null ? " ": json['category_image'];
    categoryImageThumb = json['category_image_thumb'] == null?  " ": json['category_image_thumb'];
    isFavourite = json['is_favourite'] == null ? " " : json['is_favourite'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['cat_id'] = catId;
    _data['news_type'] = newsType;
    _data['news_title'] = newsTitle;
    _data['video_url'] = videoUrl;
    _data['video_id'] = videoId;
    _data['news_image_b'] = newsImageB;
    _data['news_image_s'] = newsImageS;
    _data['news_description'] = newsDescription;
    _data['news_date'] = newsDate;
    _data['news_views'] = newsViews;
    _data['cid'] = cid;
    _data['category_name'] = categoryName;
    _data['category_image'] = categoryImage;
    _data['category_image_thumb'] = categoryImageThumb;
    _data['is_favourite'] = isFavourite;
    return _data;
  }
}

class Top_10News {
  Top_10News({
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

  Top_10News.fromJson(Map<String, dynamic> json){
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

class LatestNews {
  LatestNews({
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

  LatestNews.fromJson(Map<String, dynamic> json){
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

class CategoryList {
  CategoryList({
    required this.cid,
    required this.categoryName,
    required this.categoryImage,
    required this.categoryImageThumb,
  });
  late final String cid;
  late final String categoryName;
  late final String categoryImage;
  late final String categoryImageThumb;

  CategoryList.fromJson(Map<String, dynamic> json){
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