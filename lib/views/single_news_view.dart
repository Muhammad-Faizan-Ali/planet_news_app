// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:planet_news/app_constant/color_const.dart';
import 'package:planet_news/app_constant/ui_constant.dart';
import 'package:planet_news/enum/app_status.dart';
import 'package:planet_news/singleton/singletonConsts.dart';
import 'package:planet_news/view_model/Fav-Unfav_view_model.dart';
import 'package:planet_news/view_model/comment_view_model.dart';
import 'package:planet_news/view_model/home_news_view_model.dart';
import 'package:planet_news/view_model/single_news_view_model.dart';
import 'package:planet_news/widgets/custom_button.dart';
import 'package:planet_news/widgets/full_screen_loader.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:favorite_button/favorite_button.dart';

import 'news_home_page_screen.dart';

class NewsDetails extends StatefulWidget {
  NewsDetails({
    // required this.homeNewsViewModel,
    required this.index,
    required this.NewsID,
    required this.UID,
    // this.imageSrc,
    // required this.controller,
    // required this.singleNewsList,

});

  List singleNewsList = [];
  int index;
  String NewsID;
  String UID;
  bool _isLoading = false;
  bool _isFav = false;
  // HomeNewsViewModel homeNewsViewModel;
  // String? imageSrc;
  // YoutubePlayerController controller;

  static String id = 'newsDetails';

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {

  void getNewsData ()async{
    await Provider.of<SingleNewsViewModel>(context,listen: false).getSingleNews(widget.NewsID, widget.UID);
  }


  @override
  void initState() {

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      getNewsData();
      // print(widget.NewsID);
      // print(widget.UID);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _commentController = new TextEditingController();

    HomeNewsViewModel _newsModel = Provider.of<HomeNewsViewModel>(context);
    SingleNewsViewModel _singleNewsModel = Provider.of<SingleNewsViewModel>(context);
    // widget.singleNewsList = _singleNewsModel.getSingleNewsList;
    CommentViewModel _commentModel = Provider.of<CommentViewModel>(context);
    FavUnfavViewModel _favUnfavViewModel = Provider.of<FavUnfavViewModel>(context);

    TextEditingController _searchController = new TextEditingController();

    return _singleNewsModel.getAppStatus == AppStatus.LOADING ? FullScreenLoader() : Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      controller: _searchController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(Bidi.stripHtmlIfNeeded(_singleNewsModel.singleNewsList[0].newsTitle), style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),),
                    SizedBox(height: 20,),
                    // Text(_singleNewsModel.get,
                    // style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19,color: Colors.black.withOpacity(0.7)),),
                    // SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: IconButton(onPressed: (){
                            setState(() {
                              Share.share(Bidi.stripHtmlIfNeeded(_singleNewsModel.singleNewsList[0].videoUrl));
                            });
                          },
                              icon: Icon(Icons.share)),
                        ),
                        Container(
                          child: FavoriteButton(
                            valueChanged: (isFavourite)async{
                              // _isFav = isFavourite;

                              print("Is Fav : $isFavourite");
                              if(isFavourite == true)
                                {
                                  Fluttertoast.showToast(msg: "Added to Favourite");
                                  _favUnfavViewModel.addToFav(_singleNewsModel.singleNewsList[0].id,Singleton.UserID);
                                }
                              else if(isFavourite == false)
                                {
                                  Fluttertoast.showToast(msg: "Removed to Favourite");

                                  _favUnfavViewModel.addToFav(_singleNewsModel.singleNewsList[0].id,Singleton.UserID);
                                }

                              if(_favUnfavViewModel.getStatusMsg == "1")
                                {
                                  // showSnackBar(context: context, message: _favUnfavViewModel.getResultMsg);
                                  print(Singleton.UserID);
                                }
                              else if(_favUnfavViewModel.getStatusMsg == "0")
                              {
                                  Fluttertoast.showToast(msg: "There is an Issue. Try Again Later");
                              }
                            },

                          ),
                        )
                      ],
                    ),

                    _singleNewsModel.singleNewsList[0].newsType == "video"?
                    VideoReuse(videoURL: _singleNewsModel.singleNewsList[0].videoId) :
                    ImageReuseContainer(image_Src: _singleNewsModel.singleNewsList[0].newsImageB),

                    SizedBox(height: 20,),
                    Text(Bidi.stripHtmlIfNeeded(_singleNewsModel.singleNewsList[0].newsDescription)
                    ,style: TextStyle(fontSize: 19,color: Colors.black.withOpacity(0.7)),),

                  ],
                ),
              ),

              // SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "Author: ",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                          TextSpan(text: "Sidra Anwar @PlanetSid ",style: TextStyle(fontSize: 16,color: Colors.black.withOpacity(0.7)),),
                        ]
                      ),
                    ),
                  ],
                ),
              ),
                SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Leave a Comment",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 28,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600),
                  
              ),
              SizedBox(height: 20,),
              Container(
               
                child: TextFormField(
                  minLines: 8,
                  maxLines: 20,
                  controller: _commentController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorConst.borderColor,
                          width: 2,
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: SimpleButton(
                    btnText: 'Send',
                    onPressed: ()async{

                        widget._isLoading = true;
                        await Provider.of<CommentViewModel>(context,listen: false).submitComment(
                            Singleton.UserID,
                            _singleNewsModel.singleNewsList[0].id,
                            _commentController.text.toString());

                        widget._isLoading = false;

                      print(_commentModel.getSuccessMsg);
                      print(_singleNewsModel.singleNewsList[0].id);

                      if(_commentModel.getSuccessMsg == "1"){
                        showSnackBar(context: context,
                            message: _commentModel.getStatusMsg);
                      }
                      print(_commentController.text.toString());
                    },
                  ),
                ),
              ),
                  ],
                ),
              ),


              SizedBox(height: 20,),
              


         
            ],
          ),
        ),
      ),
    );
  }
}
class CustomCircular extends StatelessWidget {
  const CustomCircular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(),
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
    required this.videoURL,
});
  //YoutubePlayerController youtubePlayerController;
  String videoURL = '';




  @override
  _VideoReuseState createState() => _VideoReuseState();
}

class _VideoReuseState extends State<VideoReuse> {

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: YoutubePlayerController(
          flags: YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
            controlsVisibleAtStart: true,
          ),
            initialVideoId: YoutubePlayer.convertUrlToId(widget.videoURL)!,
        ),
        // controller: widget.youtubePlayerController,
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