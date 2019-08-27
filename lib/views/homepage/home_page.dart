
import 'package:flutter/material.dart';
import 'package:flutterkeepgoing/common/app_bar.dart';
import 'package:flutterkeepgoing/views/homepage/home_of_banner_widget.dart';
import 'package:flutterkeepgoing/views/homepage/home_of_ieaclass_widget.dart';
import 'package:flutterkeepgoing/views/homepage/home_of_openclass_widget.dart';
import 'package:flutterkeepgoing/views/homepage/home_of_openclasslist_widget.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage>, SingleTickerProviderStateMixin {
 
  @override
  bool get wantKeepAlive => true; 

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: "IEA认证",
        isBack: false,
      ),
      body: ListView(
        // shrinkWrap: true,
        children: <Widget>[
          HomeOfBannerWidget(),
          HomeOfOpenClassWidget(),
          HomeOfOpenClassListWidget(),
          HomeOfIEAClassWidget(),
        ],
      )
    );
  }
}
