import 'package:fluro/fluro.dart';
import 'package:flutterkeepgoing/routers/router_init.dart';

import 'home_page.dart';


class HomePageRouter implements IRouterProvider{

  static String homePage = "/home";
  
  @override
  void initRouter(Router router) {
    router.define(homePage, handler: Handler(handlerFunc: (_, params) => HomePage()));
  }
  
}