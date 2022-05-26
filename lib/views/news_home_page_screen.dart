import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/model/news_list_by_catID_model.dart';
import 'package:planet_news/model/search_news_model.dart';
import 'package:planet_news/singleton/singletonConsts.dart';
import 'package:planet_news/view_model/Fav-Unfav_view_model.dart';
import 'package:planet_news/view_model/home_news_view_model.dart';
import 'package:planet_news/view_model/searchNewsViewModel.dart';
import 'package:planet_news/views/search.dart';
import 'package:planet_news/widgets/full_screen_loader.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:planet_news/view_model/news_list_by_catID_ViewModel.dart';
import 'single_news_view.dart';

// import 'package:easy_loading/easy_loading.dart';

class News_updates extends StatefulWidget {
  static String id = 'news_updates';

  News_updates({this.CatID, required this.newsList});
  String? CatID;
  List<NewsbyCatIDList> newsList = [];

  @override
  _News_updatesState createState() => _News_updatesState();
}

class _News_updatesState extends State<News_updates> {
  bool _isLoading = false;
  bool _isFav = false;
  @override
  void initState() {

    // TODO: implement initState
    switch (widget.CatID) {
      case "1":
        {
          super.initState();
          WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
            Provider.of<NewsListByCatIDViewModel>(context, listen: false)
                .getHomeNews(Singleton.UserID, "1");
          });
        }
        break;
      case "2":
        {
          super.initState();
          WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
            Provider.of<NewsListByCatIDViewModel>(context, listen: false)
                .getHomeNews(Singleton.UserID, "2");
          });
        }
        break;
      case "3":
        {
          super.initState();
          WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
            Provider.of<NewsListByCatIDViewModel>(context, listen: false)
                .getHomeNews(Singleton.UserID, "3");
          });
        }
        break;
      case "4":
        {
          super.initState();
          WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
            Provider.of<NewsListByCatIDViewModel>(context, listen: false)
                .getHomeNews(Singleton.UserID, "4");
          });
        }
        break;

      case "5":
        {
          super.initState();
          WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
            Provider.of<NewsListByCatIDViewModel>(context, listen: false)
                .getHomeNews(Singleton.UserID, "5");
          });
        }
        break;

      case "5":
        {
          super.initState();
          WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
            Provider.of<NewsListByCatIDViewModel>(context, listen: false)
                .getHomeNews(Singleton.UserID, "5");
          });
        }
        break;

      case "6":
        {
          super.initState();
          WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
            Provider.of<NewsListByCatIDViewModel>(context, listen: false)
                .getHomeNews(Singleton.UserID, "6");
          });
        }
        break;
      case "10":
        {
          super.initState();
          WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
            Provider.of<NewsListByCatIDViewModel>(context, listen: false)
                .getHomeNews(Singleton.UserID, "10");
          });
        }
        break;
    }
  }

  // YoutubePlayerController _controller = YoutubePlayerController(
  //   initialVideoId: 'iLnmTe5Q2Qw',
  //   flags: YoutubePlayerFlags(
  //     autoPlay: true,
  //     mute: true,
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    HomeNewsViewModel _newsModel = Provider.of<HomeNewsViewModel>(context);

    NewsListByCatIDViewModel _catIdnewsViewModel =
        Provider.of<NewsListByCatIDViewModel>(context);

    SearchNewsViewModel _SearchNewsModel =
        Provider.of<SearchNewsViewModel>(context);
    TextEditingController _searchController = new TextEditingController();
    FavUnfavViewModel _favUnfavViewModel = Provider.of<FavUnfavViewModel>(context);


    return _catIdnewsViewModel.getAppStatus == AppStatus.LOADING
        ? FullScreenLoader()
        : Scaffold(
            backgroundColor: ColorConst.screen_bg,
            appBar: AppBar(
              title: const Text(""),
              backgroundColor: ColorConst.home_page_container,
              elevation: 0,
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(Icons.person),
                ),
              ],
            ),
            body: _newsModel.getAppStatus == AppStatus.LOADING
                ? FullScreenLoader()
                : SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            height: 120,
                            decoration: const BoxDecoration(
                              color: ColorConst.home_page_container,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                              ),
                            ),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {

                                    WidgetsBinding.instance
                                        ?.addPostFrameCallback((timeStamp) {

                                      showSearch(
                                          context: context,
                                          delegate: SearchQueryNews());
                                    });
                                  },
                                  child: CustomSearchField(
                                    hintText: "Search Here",
                                    controller: _searchController,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          // _newsModel.latestNewsList[0].newsType == "video" ? NewsVideoReuseContainer() : NewsReuseImageContainer(),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                // FutureBuilder<List<NewsbyCatIDList>>(
                                //   future: _SearchNewsModel.getSearchNews(
                                //       Singleton.UserID,
                                //       _searchController.text.toString()),
                                //   builder: (context,
                                //       AsyncSnapshot<dynamic> snapshot) {
                                //     var data = snapshot.data;
                                //     if (!snapshot.hasData) {
                                //       return const Center(
                                //         child: CircularProgressIndicator(),
                                //       );
                                //     }
                                //     return
                                //   },
                                // ),
                                ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: widget.newsList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String? VideoID =
                                        YoutubePlayer.convertUrlToId(
                                            widget.newsList[index].videoId,
                                            trimWhitespaces: true);
                                    YoutubePlayerController _controller =
                                        YoutubePlayerController(

                                      initialVideoId: VideoID.toString(),
                                      flags: const YoutubePlayerFlags(

                                        controlsVisibleAtStart: false,
                                        autoPlay: false,
                                        mute: false,
                                      ),
                                    );
                                    return widget.newsList[index].newsType ==
                                            "video"
                                        ? NewsVideoReuseContainer(
                                            index: index,
                                            youtubePlayerController:
                                                _controller,
                                            newsList: widget.newsList,
                                          )
                                        : NewsReuseImageContainer(
                                            index: index,
                                            controller: _controller,
                                            newsList: widget.newsList,
                                          );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Divider(
                                      thickness: 1,
                                      color: Colors.black.withOpacity(0.5),
                                    );
                                  },
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

class NewsReuseImageContainer extends StatefulWidget {
  int index;
  YoutubePlayerController controller;
  NewsReuseImageContainer({
    required this.index,
    required this.controller,
    required this.newsList,
  });
  List<NewsbyCatIDList> newsList = [];

  @override
  _NewsReuseImageContainerState createState() =>
      _NewsReuseImageContainerState();
}

class _NewsReuseImageContainerState extends State<NewsReuseImageContainer> {
  @override
  Widget build(BuildContext context) {
    HomeNewsViewModel _newsModel = Provider.of<HomeNewsViewModel>(context);

    return Ink(
      child: InkWell(
        onTap: () {
          print(" Index Value:: ${widget.index}");
          print(widget.newsList[widget.index].id);
          print(Singleton.UserID);
          Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 300),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secAnimation,
                      Widget child) {
                    animation = CurvedAnimation(parent: animation, curve: Curves.easeInOutQuad);
                    return FadeTransition(opacity: animation, child: child);
                  },
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secAnimation) {
                    return NewsDetails(
                      // homeNewsViewModel: _newsModel,
                      index: widget.index,
                      UID: Singleton.UserID,
                      NewsID: widget.newsList[widget.index].id,

                      // imageSrc:_newsModel.latestNewsList[widget.index].newsImageB,
                      // controller: widget.controller,)
                    );
                  }
                  )
          );




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






class NewsVideoReuseContainer extends StatefulWidget {
  NewsVideoReuseContainer(
      {required this.youtubePlayerController,
      required this.index,
      required this.newsList});
  final YoutubePlayerController youtubePlayerController;
  int index;

  List<NewsbyCatIDList> newsList = [];

  // String URL = _newsModel.latestNewsList[index].videoUrl;
  // NewsVideoReuseContainer({required this.index,required this});

  @override
  _NewsVideoReuseContainerState createState() =>
      _NewsVideoReuseContainerState();
}

class _NewsVideoReuseContainerState extends State<NewsVideoReuseContainer> {
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

class CustomSearchField extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  CustomSearchField({required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: (){
        showSearch(context: context, delegate: SearchQueryNews());
      },
      //onChanged: (value)=>NextField(value:value,focusNode: pin2FocusNode),
      //   enabled: isEnabled,
      keyboardType: TextInputType.text,
      controller: controller,
      // readOnly: isReadOnly,
      autofocus: false,
      obscureText: false,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 20,
      ),
      enableSuggestions: true,
      cursorColor: Colors.black.withOpacity(0.8),
      decoration: InputDecoration(
        prefixIcon: Container(
          margin: const EdgeInsets.only(right: 10),
          child: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          decoration: const BoxDecoration(
              border: const Border(
                  right: const BorderSide(width: 1, color: Colors.black))),
        ),
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
        ),
      ),
    );
  }
}
