import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'package:planet_news/view_model/home_news_view_model.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'news_home_page_screen.dart';

class NewsDetails extends StatefulWidget {
  NewsDetails({
    required this.homeNewsViewModel,
    required this.index,
    this.imageSrc,
    required this.controller,

});
  int index;
  HomeNewsViewModel homeNewsViewModel;
  String? imageSrc;
  YoutubePlayerController controller;

  static String id = 'newsDetails';

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {

  @override
  Widget build(BuildContext context) {
    HomeNewsViewModel _newsModel = Provider.of<HomeNewsViewModel>(context);
    return Scaffold(
      backgroundColor: ColorConst.screen_bg,
      appBar: AppBar(
        title: Text(""),
        backgroundColor: ColorConst.home_page_container,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      body:SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                height: 120,
                decoration: BoxDecoration(
                  color: ColorConst.home_page_container,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    CustomSearchField(
                      hintText: "Search Here",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          Text("Location Near Faisalabad",
                              style:
                              TextStyle(fontSize: 18, color: Colors.white)),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(Bidi.stripHtmlIfNeeded(_newsModel.latestNewsList[widget.index].newsTitle.trim())
                    ,style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),),
                    SizedBox(height: 20,),
                    Text(_newsModel.latestNewsList[widget.index].newsDate,
                    style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19,color: Colors.black.withOpacity(0.7)),),
                    // SizedBox(height: 5,),

                    _newsModel.latestNewsList[widget.index].newsType == "video"?VideoReuse(youtubePlayerController: widget.controller,):ImageReuseContainer(image_Src: _newsModel.latestNewsList[widget.index].newsImageB,),





                    SizedBox(height: 20,),
                    Text(Bidi.stripHtmlIfNeeded(_newsModel.latestNewsList[widget.index].newsDescription)
                    ,style: TextStyle(fontSize: 19,color: Colors.black.withOpacity(0.7)),),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageReuseContainer extends StatelessWidget {
  ImageReuseContainer({

    required this.image_Src
  });

  String image_Src;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: double.infinity,
      height: 250,
      child: Image.network("${image_Src}"),
    );
  }
}



class VideoReuse extends StatefulWidget {
  VideoReuse({
    required this.youtubePlayerController,
});
  YoutubePlayerController youtubePlayerController;


  @override
  _VideoReuseState createState() => _VideoReuseState();
}

class _VideoReuseState extends State<VideoReuse> {
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: widget.youtubePlayerController,
      ), builder: (context, player) {
      return Container(
        width: double.infinity,
        height: 300,
        child: player,
      );
    },
    );
  }
}