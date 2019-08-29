import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterkeepgoing/common/styles.dart';
import 'package:flutterkeepgoing/util/image_utils.dart';
import 'package:oktoast/oktoast.dart';

class ProgressDialog extends Dialog {
  ProgressDialog({Key key, this.hintText}) : super(key: key);

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 88.0,
          width: 120.0,
          decoration: ShapeDecoration(
              color: Color(0xFF3A3A3A),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoActivityIndicator(radius: 14.0),
              Gaps.vGap8,
              Text(
                hintText,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomerServiceDialog extends Dialog {
  Function onCloseEvent;
  CustomerServiceDialog({Key key, @required this.onCloseEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            // margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            margin: EdgeInsets.only(left: 50, right: 50, top: 100),
            height: 350,

            decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            child: Column(
              children: <Widget>[
                _buildTitle(),
                Expanded(
                  flex: 1,
                  child: _buildContentWidget(),
                ),
                _buildButton(),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.bottomCenter,
            child: new GestureDetector(
              child:
                  loadAssetImage("mine/3.0x/closewhite", width: 20, height: 20),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Text(
        '咨询客服',
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 19,
            decoration: TextDecoration.none,
            color: Colors.black),
      ),
    );
  }

  Widget _buildContentWidget() {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10),
              child: Text(
                "微信咨询",
                style: TextStyles.textBoldDark16,
              )),
        ),
        Padding(
            padding: EdgeInsets.only(left: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                Text(
                  "马老师: ma18727263738",
                  style: TextStyles.textNormal16,
                ),
                Container(
                  height: 20.0,
                  child: FlatButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: 'ma18727263738'));
                      // 从剪切板读取 var text = Clipboard.getData(Clipboard.kTextPlain);
                      showToast("复制成功",
                          position: ToastPosition(align: Alignment.center));
                    },
                    child: Text("复制微信号"),
                    textColor: Colors.orangeAccent,
                    color: Color.fromRGBO(243, 243, 243, 1.0),
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.white,
                    highlightColor: Colors.grey,
                  ),
                ),
              ],
            )),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: loadAssetImage("WechatIMG2",width: 120,height: 120),
        ),
        Text('保存图片到相册，打开微信扫一扫添加老师', style: TextStyles.textNormal12),
      ],
    ));
  }

  Widget _buildButton() {
    return GestureDetector(
        child: Container(
          alignment: Alignment.center,
          width: 240,
          height: 40,
          margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
          decoration: ShapeDecoration(
            color: Color(0xffff6700),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(23.0),
              ),
            ),
          ),
          child: Text(
            '保存图片',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF),
              fontSize: 16.0,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        onTap: () {
          saveNetworkImageToPhoto(
                  'https://xszx-test-1251987637.cosbj.myqcloud.com/images/ma19927549262.jpeg')
              .then((bool done) {
            showToast(done ? "保存成功" : "保存失败",
                position: ToastPosition(align: Alignment.center));
          });
          // 开启定时器即时关闭
          // const timeout = const Duration(seconds: 3);
          // Timer(timeout, () {
          //   onCloseEvent();
          // });
        });
  }
}
