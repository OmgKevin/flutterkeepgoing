import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterkeepgoing/common/styles.dart';
import 'package:flutterkeepgoing/util/image_utils.dart';
import 'package:flutterkeepgoing/widgets/click_item.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with
        AutomaticKeepAliveClientMixin<MinePage>,
        SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;
  File _imageFile;

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
                    SetRoundImage(image: _imageFile
                        // onTap: ,  点击吊起路由跳转
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
                top: 50,
                left: 70.0,
                right: 20.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    loadAssetImage("mine/3.0x/weixin", width: 20, height: 20),
                    Text("客服",
                        style: TextStyle(color: Colors.white, fontSize: 15.0)),
                  ],
                ),
              )
            ],
          ),
        ),
        Gaps.vGap5,
        ClickItem(
          title: "意见反馈",
          itemicon: 'mine/3.0x/yijian',
          onTap: () {},
        ),
        ClickItem(
          title: "设置",
          itemicon: 'mine/3.0x/shezhi',
          onTap: () {},
        ),
      ],
    ));
  }
}