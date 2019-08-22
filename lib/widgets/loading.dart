import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  final Color textColor;
  final Color circleColor;
  final Color backgroundColor;
  LoadingPage({Key key, this.textColor, this.circleColor, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: backgroundColor ?? Color(0xFFF6F6F6),
        child: SizedBox.expand(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              strokeWidth: 4.0,
              backgroundColor: Colors.blue,
              // value: 0.2,
              valueColor:
                  new AlwaysStoppedAnimation<Color>(circleColor ?? Colors.grey),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("正在加载数据...",
                  style: new TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0, //字体大小
                    color: textColor ?? const Color(0xff999999), //文字颜色
                  )),
            )
          ],
        )));
  }
}
