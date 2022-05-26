import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/model/category_list_model.dart';
import 'package:planet_news/singleton/singletonConsts.dart';
import 'package:planet_news/view_model/searchNewsViewModel.dart';
import 'package:planet_news/views/single_news_view.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../model/news_list_by_catID_model.dart';
import '../model/search_news_model.dart';
import '../view_model/home_news_view_model.dart';
import '../view_model/news_list_by_catID_ViewModel.dart';
import '../widgets/custom_drawer.dart';
import 'news_home_page_screen.dart';
import '../view_model/categoryListViewModel.dart';
import 'package:provider/provider.dart';

class SearchQueryNews extends SearchDelegate {







  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    // throw UnimplementedError();
    return [
      IconButton(onPressed: () {
        query = '';
      },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        // Navigator.pop(context);
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
    // throw UnimplementedError();
  }
  // void getNews()async{
  //   List<SearchNewsList> searchList = await
  //   ;
  // }
  @override
  Widget buildResults(BuildContext context) {
    SearchNewsViewModel _searchModel = Provider.of<SearchNewsViewModel>(context);
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _searchModel.getSearchNews(Singleton.UserID, query);
      print(_searchModel);
      print(query);
    });
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _searchModel.getSearchLatestNews.length,
      itemBuilder:
          (BuildContext context, int index) {
        String? VideoID =
        YoutubePlayer.convertUrlToId(
            _searchModel.getSearchLatestNews[index].videoId,
            trimWhitespaces: true);
        YoutubePlayerController _controller =
        YoutubePlayerController(
          initialVideoId: VideoID.toString(),
          flags: const YoutubePlayerFlags(
            controlsVisibleAtStart: false,
            autoPlay: true,
            mute: false,
          ),
        );
        return _searchModel.getSearchLatestNews[index].newsType ==
            "video"
            ? SearchVideoContainer(
          index: index,
          youtubePlayerController:
          _controller,
          newsList: _searchModel.getSearchLatestNews,
        )
            : SearchImageContainer(
          index: index,
          controller: _controller,
          newsList: _searchModel.getSearchLatestNews,
        );
      },
      separatorBuilder:
          (BuildContext context, int index) {
        return Divider(
          thickness: 1,
          color: Colors.black.withOpacity(0.5),
        );
      },
    );



  }
  @override
  Widget buildSuggestions(BuildContext context) {
    List<CategoryData> _CatList = Provider.of<CategoryListViewModel>(context).getCatList;
    return buildSuggestionsSuccess(_CatList);

  }
}


class SearchImageContainer extends StatefulWidget {
  int index;
  YoutubePlayerController controller;
  SearchImageContainer({
    required this.index,
    required this.controller,
    required this.newsList,
  });
  List<SearchNewsList> newsList = [];


  @override
  _SearchImageContainerState createState() => _SearchImageContainerState();
}
class _SearchImageContainerState extends State<SearchImageContainer> {
  @override
  Widget build(BuildContext context) {
    HomeNewsViewModel _newsModel = Provider.of<HomeNewsViewModel>(context);

    return Ink(
      child: InkWell(
        onTap: () {
          print(" Index Value:: ${widget.index}");
          print(widget.newsList[0].id);
          print(Singleton.UserID);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsDetails(
                  // homeNewsViewModel: _newsModel,
                  index: widget.index,
                  UID: Singleton.UserID,
                  NewsID: widget.newsList[widget.index].id,

                  // imageSrc:_newsModel.latestNewsList[widget.index].newsImageB,
                  // controller: widget.controller,)
                ),
              ));
        },
        child: Container(
          height: 200,
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: 190.0,
                    height: 160.0,
                    // child: Text("Image"),
                    child:
                    Image.network(widget.newsList[widget.index].newsImageB),
                    // child: player,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.public),
                      Text(
                        // Provider.of<HomeNewsViewModel>(context).latestNewsList[widget.index].newsDate,
                        widget.newsList[widget.index].newsDate,
                        style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Text(
                        Bidi.stripHtmlIfNeeded(
                          // Provider.of<HomeNewsViewModel>(context).latestNewsList[widget.index].newsTitle
                          widget.newsList[widget.index].newsTitle,
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}









class SearchVideoContainer extends StatefulWidget {
  SearchVideoContainer(
      {required this.youtubePlayerController,
        required this.index,
        required this.newsList});
  final YoutubePlayerController youtubePlayerController;
  int index;

  List<SearchNewsList> newsList = [];
  @override
  _SearchVideoContainerState createState() => _SearchVideoContainerState();
}

class _SearchVideoContainerState extends State<SearchVideoContainer> {
  @override
  Widget build(BuildContext context) {
    HomeNewsViewModel _newsModel = Provider.of<HomeNewsViewModel>(context);
    return Ink(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsDetails(
                    index: widget.index,
                    UID: Singleton.UserID,
                    NewsID: widget.newsList[widget.index].id,
                  )));
        },
        child: Container(
          height: 200,
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: widget.youtubePlayerController,
                      bottomActions: const [
                        // CurrentPosition(),
                        // const SizedBox(width: 10.0),
                        // ProgressBar(isExpanded: true),
                        // const SizedBox(width: 10.0),
                        // RemainingDuration(),
                        // FullScreenButton(),
                      ],
                    ),
                    builder: (context, player) {
                      return Container(
                        width: 210.0,
                        height: 160.0,
                        child: player,
                        // child: player,
                      );
                    },
                    // child:
                  ),
                  Row(
                    children: [
                      const Icon(Icons.public),
                      Text(
                        // Provider.of<HomeNewsViewModel>(context).latestNewsList[widget.index].newsDate,
                        widget.newsList[widget.index].newsDate,
                        style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Text(
                        Bidi.stripHtmlIfNeeded(
                          // Provider.of<HomeNewsViewModel>(context).latestNewsList[widget.index].newsTitle
                          widget.newsList[widget.index].newsTitle,
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



Widget buildSuggestionsSuccess(List<CategoryData> suggestions) {
  final catList = suggestions;
  return ListView.builder(
    itemCount: catList.length,
      itemBuilder: (context,index){
        // final suggestions = ;
        return ListTile(
          onTap: ()async{
            List<NewsbyCatIDList> newsList = await Provider.of<NewsListByCatIDViewModel>(context,listen: false).
            getHomeNews(Singleton.UserID, catList[index].cid);
            for(var i in newsList)
              print(i);
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>News_updates(
                  CatID: catList[index].cid,
                  newsList: newsList,
                )));
            // Navigator.pushNamed(context, News_updates.id);

          },
            leading: DrawerIcons[index],
          title: Text(catList[index].categoryName),
        );
      }
  );
}