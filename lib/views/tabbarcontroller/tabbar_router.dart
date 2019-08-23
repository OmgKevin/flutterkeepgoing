import 'package:fluro/fluro.dart';
import 'package:flutterkeepgoing/routers/router_init.dart';
import 'package:flutterkeepgoing/views/tabbarcontroller/tabbarcontroller.dart';


class TabbarRouter implements IRouterProvider{

  static String tabbarcontorller = "/tabbarcontorller";
  
  @override
  void initRouter(Router router) {
    router.define(tabbarcontorller, handler: Handler(handlerFunc: (_, params) => TabbarController()));
  }
  
}