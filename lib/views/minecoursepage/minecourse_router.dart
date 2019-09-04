import 'package:fluro/fluro.dart';
import 'package:flutterkeepgoing/routers/router_init.dart';
import 'package:flutterkeepgoing/widgets/videoplayer_widget.dart';

import 'minecourse_page.dart';


class MineCoursePageRouter implements IRouterProvider{

  static String mineCoursePage = "/minecourse";
  static String videoPlayerPage = "/minecourse/videoplayer";
  
  
  @override
  void initRouter(Router router) {
    router.define(mineCoursePage, handler: Handler(handlerFunc: (_, params) => MineCoursePage()));
    router.define(videoPlayerPage, handler: Handler(handlerFunc: (_, params) => VideoPlayerWidget()));

  }
}