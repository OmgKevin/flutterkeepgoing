
import 'package:flutter/material.dart';
import 'package:flutterkeepgoing/common/app_bar.dart';
import 'package:flutterkeepgoing/views/loginpage/login_page.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class MineCourisePage extends StatefulWidget {
  MineCourisePage({Key key}) : super(key: key);

  @override
  _MineCourisePageState createState() => _MineCourisePageState();
}


class _MineCourisePageState extends State<MineCourisePage> with AutomaticKeepAliveClientMixin<MineCourisePage>, SingleTickerProviderStateMixin {
 
  @override
  bool get wantKeepAlive => true; 

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: "我的课程",
        isBack: false,
      ),
      body: Center(
         child: Text('我的课程'),
      ),
    );
  }
}