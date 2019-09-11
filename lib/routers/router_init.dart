
import 'package:fluro/fluro.dart';
import 'package:flutterkeepgoing/views/homepage/home_page.dart';
import 'package:flutterkeepgoing/views/homepage/openclasspage/openclass_page.dart';
import 'package:flutterkeepgoing/views/minecoursepage/minecourse_page.dart';
import 'package:flutterkeepgoing/views/minepage/accountinfopage/accountinfo_page.dart';
import 'package:flutterkeepgoing/views/minepage/feedbackpage/feedback_page.dart';
import 'package:flutterkeepgoing/views/minepage/mine_page.dart';
import 'package:flutterkeepgoing/views/minepage/settingpage/setting_page.dart';
import 'package:flutterkeepgoing/views/tabbarcontroller/tabbarcontroller.dart';
import 'package:flutterkeepgoing/widgets/videoplayer_widget.dart';

class MyPageRouter {
  
  static String tabbarcontorller = "/tabbarcontorller";
  static String homePage = "/home";
  static String openClassPage = "/home/openclass";
  static String mineCoursePage = "/minecourse";
  static String videoPlayerPage = "/minecourse/videoplayer";
  static String minePage = "/mine";
  static String feedbackPage = "/mine/feedback";
  static String settingPage = "/mine/setting";
  static String accountInfoPage = "/mine/accountinfo";
  
  

  void initRouter(Router router) {

    router.define(tabbarcontorller, handler: Handler(handlerFunc: (_, params) => TabbarController()));
    router.define(homePage, handler: Handler(handlerFunc: (_, params) => HomePage()));
    router.define(openClassPage, handler: Handler(handlerFunc: (_, params) => OpenClassPage()));
    router.define(mineCoursePage, handler: Handler(handlerFunc: (_, params) => MineCoursePage()));
    router.define(videoPlayerPage, handler: Handler(handlerFunc: (_, params) => VideoPlayerWidget()));
    router.define(minePage, handler: Handler(handlerFunc: (_, params) => MinePage()));
    router.define(feedbackPage, handler: Handler(handlerFunc: (_, params) => FeedBackPage()));
    router.define(settingPage, handler: Handler(handlerFunc: (_, params){
     String string = params['message']?.first;
     return SettingPage(message: string);
    }));
    router.define(accountInfoPage, handler: Handler(handlerFunc: (_, params) => AccountInfoPage()));

  }
}
