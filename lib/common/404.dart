
import 'package:flutter/material.dart';
import 'package:flutterkeepgoing/common/app_bar.dart';
// import 'package:flutter_deer/widgets/app_bar.dart';
// import 'package:flutter_deer/widgets/state_layout.dart';

class WidgetNotFound extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: "页面不存在",
      ),
      // body: StateLayout(
      //   type: StateType.account,
      //   hintText: "页面不存在",
      // ),
    );
  }
}
