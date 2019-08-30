import 'package:fluro/fluro.dart';
import 'package:flutterkeepgoing/routers/router_init.dart';

import 'feedbackpage/feedback_page.dart';
import 'mine_page.dart';


class MinePageRouter implements IRouterProvider{

  static String minePage = "/mine";
  static String feedbackPage = "/mine/feedback";

  
  @override
  void initRouter(Router router) {
    router.define(minePage, handler: Handler(handlerFunc: (_, params) => MinePage()));
    router.define(feedbackPage, handler: Handler(handlerFunc: (_, params) => FeedBackPage()));

  }
}