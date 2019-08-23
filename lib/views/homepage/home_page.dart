
import 'package:flutter/material.dart';
import 'package:flutterkeepgoing/common/app_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

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
      body: Center(
         child: Text('首页'),
      ),
    );
  }
}
