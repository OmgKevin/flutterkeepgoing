import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterkeepgoing/common/key_config.dart';
import 'package:flutterkeepgoing/routers/fluro_navigator.dart';
import 'package:flutterkeepgoing/util/image_utils.dart';
import 'package:flutterkeepgoing/util/shared_util.dart';
import 'package:flutterkeepgoing/util/utils.dart';
import 'package:flutterkeepgoing/views/homepage/home_router.dart';
import 'package:flutterkeepgoing/views/tabbarcontroller/tabbar_router.dart';
import 'package:rxdart/rxdart.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int _status = 0;
  List<String> _guideList = [
    "app_start_1",
    "app_start_2",
    "app_start_3",
  ];

  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _initSplash();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _initSplash() {
    _subscription =
        Observable.just(1).delay(Duration(milliseconds: 3000)).listen((_) {
      _initAsync();
    });
  }

  void _initAsync() async {
    await SpUtil.getInstance();
    if (SpUtil.getBool(Keys.key_guide, defValue: true)) {
      SpUtil.putBool(Keys.key_guide, false);
      _initGuide();
    } else {
      _goHomePage();
    }
  }

  void _initGuide() {
    setState(() {
      _status = 1;
    });
  }

  _goHomePage() {
    NavigatorUtils.push(context, TabbarRouter.tabbarcontorller, replace: true);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Offstage(
            offstage: !(_status == 0),
            child: Image.asset(
              Utils.getImgPath("start_page", format: "png"),
              width: double.infinity,
              fit: BoxFit.fill,
              height: double.infinity,
            ),
          ),
          Offstage(
              offstage: !(_status == 1),
              child: Swiper(
                itemCount: _guideList.length,
                loop: false,
                itemBuilder: (_, index) {
                  return loadAssetImage(
                    _guideList[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  );
                },
                onTap: (index) {
                  if (index == _guideList.length - 1) {
                    _goHomePage();
                  }
                },
              ))
        ],
      ),
    );
  }
}
