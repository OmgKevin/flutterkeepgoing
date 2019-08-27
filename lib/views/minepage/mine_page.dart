import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {

  @override
  _MinePageState createState() => _MinePageState();
}


class _MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin<MinePage>, SingleTickerProviderStateMixin {
 
  @override
  bool get wantKeepAlive => true; 
  

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Container(
        child: Center(
          

        ),
      ),
    );
  }
}