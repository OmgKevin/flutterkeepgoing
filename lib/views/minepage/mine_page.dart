import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

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
        color: Colors.lightBlue,
        child: Center(
          child: Loading(indicator: BallPulseIndicator(), size: 100.0),
        ),
      ),
    );
  }
}