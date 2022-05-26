import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:planet_news/app_constant/string_const.dart';
import 'package:planet_news/model/single_news_model.dart';
import 'package:planet_news/view_model/ConfirmOTP_view_model.dart';
import 'package:planet_news/view_model/Fav-Unfav_view_model.dart';
import 'package:planet_news/view_model/comment_view_model.dart';
import 'package:planet_news/view_model/forgot_password_view_model.dart';
import 'package:planet_news/view_model/news_list_by_catID_ViewModel.dart';
import 'package:planet_news/view_model/privacy_policy_view_model.dart';
import 'package:planet_news/view_model/signin_view_model.dart';
import 'package:planet_news/view_model/signup_view_model.dart';
import 'package:planet_news/view_model/single_news_view_model.dart';
import 'package:planet_news/view_model/updateProfileViewModel.dart';
import 'package:planet_news/view_model/userNewsViewModel.dart';
import 'package:planet_news/view_model/userProfileViewModel.dart';
import 'package:planet_news/views/about_us_view.dart';
import 'package:planet_news/views/bottom_bar.dart';
import 'package:planet_news/views/contact_us_screen.dart';
import 'package:planet_news/views/social_signin_view.dart';
import 'package:planet_news/views/profileView.dart';
import 'package:planet_news/views/single_news_view.dart';
import 'package:planet_news/views/news_home_page_screen.dart';
import 'package:planet_news/views/otp_screen.dart';
import 'package:planet_news/views/search_email_screen.dart';
import 'package:planet_news/views/signin_screen.dart';
import 'package:planet_news/views/signup_screen.dart';
import 'package:planet_news/views/splash_screen.dart';
import 'package:planet_news/views/update_profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'views/home_page.dart';
import 'view_model/countriesList_view_model.dart';
import 'views/Social_signup_view.dart';
import 'package:planet_news/view_model/home_news_view_model.dart';
import 'view_model/categoryListViewModel.dart';
import 'package:planet_news/view_model/getLocationViewModel.dart';
import 'view_model/searchNewsViewModel.dart';



final String AppID = "8bbae138-61d6-4d44-8ca9-ce1d0e03274f";
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();

  OneSignal.shared.setAppId(AppID);
  OneSignal.shared
      .promptUserForPushNotificationPermission()
      .then((accepted) {});
  runApp(MyApp());
}




class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SigninViewModel>(
          create: (context) {
            return SigninViewModel();
          },
        ),
        ChangeNotifierProvider<ForgotPasswordViewModel>(
          create: (context) {
            return ForgotPasswordViewModel();
          },
        ),
        ChangeNotifierProvider<SignupViewModel>(
          create: (context) {
            return SignupViewModel();
          },

        ),
        ChangeNotifierProvider<CountriesListViewModel>(
          create: (context) {
            return CountriesListViewModel();
          },
        ),
        ChangeNotifierProvider<PrivacyPolicyViewModel>(
          create: (context) {
            return PrivacyPolicyViewModel();
          },
        ),
        ChangeNotifierProvider<HomeNewsViewModel>(
          create: (context){
            return HomeNewsViewModel();
          },
        ),
        ChangeNotifierProvider<CategoryListViewModel>(
          create: (context){
            return CategoryListViewModel();
          },
        ),
        ChangeNotifierProvider<SingleNewsViewModel>(
          create: (context){
            return SingleNewsViewModel();
          },
        ),
        ChangeNotifierProvider<NewsListByCatIDViewModel>(
            create: (context){
              return NewsListByCatIDViewModel();
            },
        ),
        ChangeNotifierProvider<CommentViewModel>(
          create:(context){
            return CommentViewModel();
          },
        ),
        ChangeNotifierProvider<FavUnfavViewModel>(
          create: (context){
            return FavUnfavViewModel();
          },
        ),
        ChangeNotifierProvider<SearchNewsViewModel>(
            create: (context){
              return SearchNewsViewModel();
            }
        ),
        ChangeNotifierProvider<UpdateProfileViewModel>(
          create: (context){
            return UpdateProfileViewModel();
          },
        ),
        ChangeNotifierProvider<UserNewsViewModel>(
            create: (context){
              return UserNewsViewModel();
        },
        ),
        ChangeNotifierProvider<ConfirmOTPViewModel>(
          create: (context){
            return ConfirmOTPViewModel();
          },
        ),
        ChangeNotifierProvider<UserProfileViewModel>(
            create: (context){
              return UserProfileViewModel();
            }
        ),

        // ChangeNotifierProvider<CurrentLocationViewModel>(
        //   create:(context){
        //     return CurrentLocationViewModel();
        //   },
        // ),
      ],


      builder: (context, child) {
        return MaterialApp(
          title: StringConst.app_name,
          debugShowCheckedModeBanner: false,
          //initialRoute: SplashScreen.id,
          initialRoute: SplashScreen.id,
          theme: ThemeData(fontFamily: 'Montserrat'),
          routes: {
            SplashScreen.id: (context) => SplashScreen(),
            SignInScreen.id: (context) => SignInScreen(),
            SignupScreen.id: (context) => SignupScreen(),
            OptContainer.id: (context) => OptContainer(),
            HomePageScreen.id: (context) => HomePageScreen(),
            SearchEmail.id: (context) => SearchEmail(),
            // News_updates.id: (context) => News_updates(),
            Contact.id: (context) => Contact(),
            BottomBar.id: (context) => BottomBar(),
            // SocialSignUp.id: (context) => SocialSignUp(),
            EditUIScreen.id: (context) => EditUIScreen(),
            // SocialSignInView.id: (context) => SocialSignInView(),
            UserProfileScreen.id: (context) => UserProfileScreen(),
            // NewsDetails.id: (context) => NewsDetails(),
            AboutUsView.id: (context) => AboutUsView(),


          },
        );
      },
    );
  }

// MaterialApp(
// title: StringConst.app_name,
// debugShowCheckedModeBanner: false,
// //initialRoute: SplashScreen.id,
// initialRoute: SplashScreen.id,
// routes: {
// SplashScreen.id:   (context) => SplashScreen(),
// SignInScreen.id:   (context) => SignInScreen(),
// SignupScreen.id:   (context) => SignupScreen(),
// OptContainer.id:   (context) => OptContainer(),
// HomePageScreen.id: (context) => HomePageScreen(),
// SearchEmail.id :   (context) => SearchEmail(),
// News_updates.id :  (context) => News_updates(),
// Contact.id :       (context) => Contact(),
// BottomBar.id :     (context) => BottomBar(),
// },
//
// );

}
