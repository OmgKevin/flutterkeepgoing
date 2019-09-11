import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutterkeepgoing/common/styles.dart';
import 'package:flutterkeepgoing/routers/fluro_navigator.dart';
import 'package:flutterkeepgoing/routers/router_init.dart';
import 'package:flutterkeepgoing/util/image_utils.dart';
import 'package:flutterkeepgoing/widgets/click_item.dart';
import 'package:flutterkeepgoing/widgets/progress_dialog.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with
        AutomaticKeepAliveClientMixin<MinePage>,
        SingleTickerProviderStateMixin,
        WidgetsBindingObserver {
  @override
  bool get wantKeepAlive => true;
  File _imageFile;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        print('AppLifecycleState.inactive');
        break;
      case AppLifecycleState.paused:
        print('AppLifecycleState.paused');
        break;
      case AppLifecycleState.resumed:
        print('AppLifecycleState.resumed');
        break;
      case AppLifecycleState.suspending:
        print('AppLifecycleState.suspending');
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.5, // 16:9 宽高占比
          child: Stack(
            children: <Widget>[
              loadAssetImage("mine/3.0x/hederbackground"),
              Positioned.fill(
                top: 60.0,
                child: Column(
                  children: <Widget>[
                    SetRoundImage(
                      image: _imageFile,
                      onTap: () {
                        NavigatorUtils.push(context,MyPageRouter.accountInfoPage);
                      },
                    ),
                    Gaps.vGap8,
                    Text(
                      "IEA精英6303",
                      style: TextStyles.textNormal16,
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 50.0,
                  left: 70.0,
                  right: 20.0,
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        loadAssetImage("mine/3.0x/weixin",
                            width: 20, height: 20),
                        Text("客服",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0)),
                      ],
                    ),
                    onTap: () {
                      _showServiceDialog();
                    },
                  ))
            ],
          ),
        ),
        Gaps.vGap5,
        ClickItem(
          title: "意见反馈",
          itemicon: 'mine/3.0x/yijian',
          onTap: () {
            NavigatorUtils.push(context,MyPageRouter.feedbackPage);
          },
        ),
        ClickItem(
          title: "设置",
          itemicon: 'mine/3.0x/shezhi',
          onTap: () {
             NavigatorUtils.push(context,'${MyPageRouter.settingPage}?string=测试字符串');
          },
        ),
      ],
    ));
  }

  _showServiceDialog() {
    showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomerServiceDialog(onCloseEvent: () {
          Navigator.of(context).pop();
        });
      },
    ).then((val) {});
  }

  getdeviceID() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    var data = await deviceInfo.iosInfo;
    String identifier = data.identifierForVendor;
    print('Running on $identifier'); 

  }
}
