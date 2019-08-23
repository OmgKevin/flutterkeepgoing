
import 'package:flutter/material.dart';

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
      body: Center(
         child: Text('我的课程'),
      ),
    );
  }
}