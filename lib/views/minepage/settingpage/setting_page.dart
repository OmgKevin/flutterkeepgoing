import 'package:flutter/material.dart';
import 'package:flutterkeepgoing/common/app_bar.dart';
import 'package:flutterkeepgoing/common/colors.dart';
import 'package:flutterkeepgoing/util/fluro_convert_util.dart';
import 'package:flutterkeepgoing/widgets/click_item.dart';

class SettingPage extends StatefulWidget {

  SettingPage({@required this.message});
  final String message;

  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          centerTitle: "设置",
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 10,
              color: Colours.bg_color,
            ),
            ClickItem(
              title: "关于",
              onTap: () {},
            ),
            ClickItem(
              title: "清除缓存",
              onTap: () {},
            ),

            // 用作flutroute传值
             ClickItem(
               //fluro 接收到中文字符串后的解码展示
              title: FluroConvertUtils.fluroCnParamsDecode(widget.message),
              onTap: () {},
            ),
          ],
        )
        // body: Container(
        //   child: Text(
        //     //fluro 接收到中文字符串后的解码展示
        //     FluroConvertUtils.fluroCnParamsDecode(widget.message),
        //   ),
        // ),
        );
  }
}
