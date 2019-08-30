import 'package:fluro/fluro.dart';
import 'package:flutterkeepgoing/routers/router_init.dart';
import 'package:flutterkeepgoing/views/minepage/settingpage/setting_page.dart';

import 'accountinfopage/accountinfo_page.dart';
import 'feedbackpage/feedback_page.dart';
import 'mine_page.dart';


class MinePageRouter implements IRouterProvider{

  static String minePage = "/mine";
  static String feedbackPage = "/mine/feedback";
  static String settingPage = "/mine/setting";
  static String accountInfoPage = "/mine/accountinfo";


  
  
  @override
  void initRouter(Router router) {
    router.define(minePage, handler: Handler(handlerFunc: (_, params) => MinePage()));
    router.define(feedbackPage, handler: Handler(handlerFunc: (_, params) => FeedBackPage()));
    router.define(settingPage, handler: Handler(handlerFunc: (_, params) => SettingPage()));
    router.define(accountInfoPage, handler: Handler(handlerFunc: (_, params) => AccountInfoPage()));

  }
}