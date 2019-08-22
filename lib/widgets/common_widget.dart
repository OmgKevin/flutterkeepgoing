import 'package:flutter/material.dart';

class CommonGrayStyle extends StatelessWidget {
  CommonGrayStyle({Key key, this.text, this.fontSize = 14.0}) : super(key: key);
  final String text;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: fontSize,
            color: Color(0xFF919191),
            fontWeight: FontWeight.w400));
  }
}

class CommonBlackStyle extends StatelessWidget {
  CommonBlackStyle({Key key, this.text, this.right, this.fontSize = 16.0})
      : super(key: key);
  final String text;
  final double fontSize;
  final bool right;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: right == true ? TextAlign.right : TextAlign.left,
        style: TextStyle(
            fontSize: fontSize,
            color: Color(0xFF000000),
            fontWeight: FontWeight.w400));
  }
}

class CommonTitleStyle extends StatelessWidget {
  CommonTitleStyle({Key key, this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: 16.0,
            color: Color(0xFF000000),
            fontWeight: FontWeight.w500));
  }
}

// appbar PreferredSize
class CommonPreferredSize extends StatelessWidget
    implements PreferredSizeWidget {
  CommonPreferredSize({Key key, this.text}) : super(key: key);
  final String text;
  @override
  Size get preferredSize => new Size.fromHeight(kTextTabBarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: AppBar(
          title: Text(text,
              style: TextStyle(color: Color(0xFF4a4a4a), fontSize: 18.0)),
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Color(0xFF4A4A4A)),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: Color(0xFFFFFFFF),
//        bottom: PreferredSize(
//          preferredSize: Size(double.infinity, 1),
//          child: Container(
//            width: double.infinity,
//            height: 1,
//            color: Color(0x66B2B2B2),
//          ),
//        ),
        ),
        preferredSize: Size.fromHeight(kTextTabBarHeight));
  }
}

class NotificationPreferredSize extends StatelessWidget
    implements PreferredSizeWidget {
  NotificationPreferredSize({Key key, this.text, this.callback})
      : super(key: key);
  final String text;
  final Function callback;
  @override
  Size get preferredSize => new Size.fromHeight(kTextTabBarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: AppBar(
            title: Text(text,
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18.0)),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Color(0xFF7357FF),
            leading: null,
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: GestureDetector(
                  child: Image(
                    image:
                        AssetImage('assets/images/notification/contacts.png'),
                    width: 19,
                    height: 22,
                  ),
                  onTap: () {
                    callback();
                  },
                ),
              ),
            ]),
        preferredSize: Size.fromHeight(kTextTabBarHeight));
  }
}
