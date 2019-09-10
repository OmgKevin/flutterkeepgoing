import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterkeepgoing/common/404.dart';
import 'package:flutterkeepgoing/common/webview_page.dart';
import 'package:flutterkeepgoing/routers/router_init.dart';
import 'package:flutterkeepgoing/views/homepage/home_page.dart';

class Routes {
  static String home = "/home";
  static String webViewPage = "/webview";

  static List _listRouter = [];

  static void configureRoutes(Router router) {
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      // debugPrint("未找到目标页");
      return WidgetNotFound();
    });

    router.define(home,handler: Handler(handlerFunc:(BuildContext context, Map<String, List<String>> params) => HomePage()));

    router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
      String title = params['title']?.first;
      String url = params['url']?.first;
      return WebViewPage(title: title, url: url);
    }));

    _listRouter.clear();
    
    // 集中一次性添加路由管理
    _listRouter.add(MyPageRouter());

    /// 初始化路由
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}
