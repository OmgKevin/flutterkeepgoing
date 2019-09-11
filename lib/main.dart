import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterkeepgoing/routers/fluro_navigator.dart';
import 'package:flutterkeepgoing/routers/routers.dart';
import 'package:flutterkeepgoing/views/splashpage/splash_page.dart';
import 'package:oktoast/oktoast.dart';
import 'common/colors.dart';


void main() {

 runApp(MyApp());
  // 透明状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
} 


class MyApp extends StatelessWidget {
  
 final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
 
  MyApp()  {
    final router = Router();
    Routes.configureRoutes(router);
    NavigatorUtils.router = router;
  }
  
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Flutter Keep Going',
        // debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colours.app_main,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: SplashPage(),
        onGenerateRoute: NavigatorUtils.router.generator,  
      ),
      backgroundColor: Colors.black54,
      textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      radius: 20.0,
      position: ToastPosition.bottom
    );
  }
}
