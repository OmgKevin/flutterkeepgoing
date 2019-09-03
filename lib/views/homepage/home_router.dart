import 'package:fluro/fluro.dart';
import 'package:flutterkeepgoing/routers/router_init.dart';

import 'home_page.dart';
import 'openclasspage/openclass_page.dart';


class HomePageRouter implements IRouterProvider{

  static String homePage = "/home";
  static String openClassPage = "/home/openclass";

  
  
  @override
  void initRouter(Router router) {
    router.define(homePage, handler: Handler(handlerFunc: (_, params) => HomePage()));
    router.define(openClassPage, handler: Handler(handlerFunc: (_, params) => OpenClassPage()));

  }
}