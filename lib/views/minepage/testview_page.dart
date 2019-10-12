
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterkeepgoing/common/styles.dart';
import 'package:flutterkeepgoing/util/screen_util.dart';
import 'package:flutterkeepgoing/util/toast.dart';


// 自定义键盘弹出区域 

class CustomKeyboardPage extends StatefulWidget {
  CustomKeyboardPage({Key key}) : super(key: key);

  _CustomKeyboardPagePageState createState() => _CustomKeyboardPagePageState();
}

class _CustomKeyboardPagePageState extends State<CustomKeyboardPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double appbarHeight = kToolbarHeight;
    double statusHeight = MediaQuery.of(context).padding.top;

    List userScore = [
      {
        'url':
            'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png',
        'range': 1,
        'nickName': '昵称十个字',
        'score': 10
      },
      {
        'url':
            'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png',
        'range': 1,
        'nickName': '昵称十个字',
        'score': 50
      },
      {
        'url':
            'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png',
        'range': 1,
        'nickName': '昵称十个字',
        'score': 1
      },
      {
        'url':
            'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png',
        'range': 1,
        'nickName': '昵称十个字',
        'score': 50
      },
      {
        'url':
            'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png',
        'range': 1,
        'nickName': '昵称十个字',
        'score': 10
      },
      {
        'url':
            'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png',
        'range': 1,
        'nickName': '昵称十个字',
        'score': 345
      },
      {
        'url':
            'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png',
        'range': 1,
        'nickName': '昵称十个字',
        'score': 170
      },
      {
        'url':
            'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png',
        'range': 1,
        'nickName': '昵称十个字',
        'score': 1120
      },
      {
        'url':
            'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png',
        'range': 1,
        'nickName': '昵称十个字',
        'score': 78
      }
    ];
    ScrollController _customController = ScrollController();
    _addList(score) {
      var o = {
        'url':
            'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png',
        'range': 1,
        'nickName': '昵称十个字昵称十个字昵称十个字昵称十个字',
        'score': 0
      };
      o['score'] = score;
      userScore.add(o);
      setState(() {
        userScore = userScore;
      });
      _customController.animateTo(
          (130 + 36 * (userScore.length - 10)).toDouble(),
          duration: Duration(milliseconds: 500),
          curve: Curves.ease); // 默认十个
    }

    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Container(
          child: Stack(
            children: <Widget>[
              ListView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        color: Colors.lightGreen,
                        height: 180,
                      ),
                      Container(
                        color: Colors.redAccent,
                        height: 80,
                      ),
                      Container(
                        color: Colors.yellow,
                        height: screenHeight -
                            180 -
                            80 -
                            150 -
                            appbarHeight -
                            statusHeight,
                        child: ListView3(),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: ConvertFooter(addList: _addList),
              ),
              ShareBall(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.green);
    return ListView.separated(
      itemCount: 100,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    );
  }
}

class ConvertFooter extends StatefulWidget {
  final addList;
  ConvertFooter({Key key, @required this.addList}) : super(key: key);
  _ConvertFooterState createState() => _ConvertFooterState();
}

class _ConvertFooterState extends State<ConvertFooter> {
  bool firstFour = true; // 默认第一次4位
  List<String> scoreList = ['1', '10', '50'];
  List<String> spScore = []; // 本地缓存中存的数字
  List scoreColorList = [
    Color.fromRGBO(252, 240, 163, 1),
    Color.fromRGBO(246, 186, 186, 1),
    Color.fromRGBO(186, 246, 241, 1)
  ]; // 初始的数值颜色
  int currentScore; // 当前第几个数值，从左到右
  bool scoreInputOpen = false; // 数值输入框显示隐藏
  int clickCount = 0; // 一轮中点击的次数
  TextEditingController inputController = TextEditingController();
  bool startScore = false; // 倒计时期间不可修改数值
  int restPart = 100; // 颜色还剩下的比例
  int backTime = 10; // 显示的数字倒计时
  _startClock() {
    
  }

  addScoreList() {
    print(spScore);
    spScore.forEach((item) {
      scoreColorList.insert(0, Color.fromRGBO(247, 247, 247, 1));
    });
    scoreList.insertAll(0, spScore);
  }

  @override
  void initState() {
    addScoreList();
    super.initState();
  }

  @override
  void dispose() {
    inputController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(375),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 20,
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(2, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 18),
              height: 65,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: scoreList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                if (startScore == true) return;
                                if (index == currentScore) {
                                  setState(() {
                                    currentScore = null;
                                  });
                                } else {
                                  setState(() {
                                    currentScore = index;
                                  });
                                }
                              },
                              child: Container(
                                // width: 65,
                                height: 65,
                                margin: EdgeInsets.only(left: 18),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: currentScore == index
                                            ? Color.fromRGBO(215, 118, 118, 1)
                                            : Colors.transparent,
                                        width: 2)),
                                padding: EdgeInsets.all(11),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 11),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: scoreColorList[index]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(
                                        scoreList[index],
                                        style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Color.fromRGBO(50, 50, 50, 1),
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        '积分',
                                        style: TextStyle(
                                            fontSize: 8,
                                            color:
                                                Color.fromRGBO(38, 38, 38, .5),
                                            letterSpacing: 1),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            color: Color.fromRGBO(0, 0, 0, 0.15),
                            offset: Offset(-4, 2))
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              if (startScore == true) return;
                              if (scoreInputOpen == false) {
                                setState(() {
                                  scoreInputOpen = true;
                                });
                              }
                            },
                            child: Container(
                              alignment: FractionalOffset.center,
                              margin: EdgeInsets.only(
                                  right: 12, left: scoreInputOpen ? 0 : 12),
                              width: scoreInputOpen ? 163 : 53,
                              height: 53,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(247, 247, 247, 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: !scoreInputOpen
                                  ? Text(
                                      '自定义',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color.fromRGBO(50, 50, 50, 1),
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w600),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(left: 12),
                                          width: 86,
                                          height: 28,
                                          padding: EdgeInsets.only(
                                              left: 12, right: 12),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Color.fromRGBO(
                                                      218, 218, 218, 1))),
                                          child: TextField(
                                            controller: inputController,
                                            inputFormatters: [],
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color.fromRGBO(
                                                    50, 50, 50, 1),
                                                fontWeight: FontWeight.w600),
                                            keyboardType: TextInputType.number,
                                            maxLength: 4,
                                            cursorColor:
                                                Color.fromRGBO(38, 38, 38, .5),
                                            decoration: InputDecoration(
                                              counterText: '',
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.only(top: 4),
                                            ),
                                            obscureText: false,
                                            textAlign: TextAlign.center,
                                            onChanged: (text) {
                                              if (text.length == 4) {
                                                if (firstFour) {
                                                  firstFour = false;
                                                } else {}
                                              } else {
                                                firstFour = true;
                                              }
                                            },
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            if (inputController.text != '') {
                                              if (scoreList.indexOf(
                                                      inputController.text) !=
                                                  -1) {
                                                return;
                                              }

                                              setState(() {
                                                scoreList.insert(
                                                    0, inputController.text);
                                                scoreColorList.insert(
                                                    0,
                                                    Color.fromRGBO(
                                                        247, 247, 247, 1));
                                                currentScore = 0;
                                              });
                                              spScore.insert(
                                                  0, inputController.text);
                                              inputController.text = '';
                                            }
                                            setState(() {
                                              scoreInputOpen = false;
                                            });
                                          },
                                          behavior: HitTestBehavior.translucent,
                                          child: Container(
                                              width: 53,
                                              height: 53,
                                              alignment:
                                                  FractionalOffset.center,
                                              child: Text(
                                                '确定',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color.fromRGBO(
                                                        50, 50, 50, 1),
                                                    letterSpacing: 1,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        )
                                      ],
                                    ),
                            ))
                      ],
                    ),
                  )
                ],
              )),
          GestureDetector(
              onTap: () {
                // getOffset();
                if (currentScore == null) {
                } else {
                  _startClock();
                  setState(() {
                    scoreInputOpen = false;
                    startScore = true;
                  });
                }
              },
              child: Container(
                margin: EdgeInsets.only(top: 19),
                decoration: BoxDecoration(
                  boxShadow: currentScore == null
                      ? []
                      : [
                          BoxShadow(
                              blurRadius: 10,
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(0, 4))
                        ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                      width: 284,
                      height: 44,
                      alignment: FractionalOffset.center,
                      decoration: BoxDecoration(
                        color: currentScore != null
                            ? Color.fromRGBO(50, 50, 50, 1)
                            : Color.fromRGBO(247, 247, 247, 1),
                      ),
                      child: !startScore
                          ? Text(
                              '参与',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: currentScore != null
                                      ? Color.fromRGBO(255, 255, 255, 1)
                                      : Color.fromRGBO(38, 38, 38, .5),
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w600),
                            )
                          : Stack(
                              children: <Widget>[
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 284 * restPart / 100,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(215, 118, 118, 1),
                                      // borderRadius: BorderRadius.circular(25)
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      widget.addList(scoreList[currentScore]);
                                      setState(() {
                                        clickCount += 1;
                                      });
                                    },
                                    child: Container(
                                        alignment: FractionalOffset.center,
                                        width: 284,
                                        height: 44,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                width: 142,
                                                height: 44,
                                                alignment: FractionalOffset
                                                    .centerRight,
                                                child: Text(
                                                  '连击 :',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      letterSpacing: 2,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                            Container(
                                              width: 142,
                                              height: 44,
                                              padding: EdgeInsets.only(top: 2),
                                              alignment:
                                                  FractionalOffset.centerLeft,
                                              child: Text(
                                                  ' ' + backTime.toString(),
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      letterSpacing: 2,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                              ],
                            )),
                ),
              ))
        ],
      ),
    );
  }
}

class ShareBall extends StatefulWidget {
  ShareBall({Key key}) : super(key: key);
  _ShareBallState createState() => _ShareBallState();
}

class _ShareBallState extends State<ShareBall> {
  double kFloatWidgetWidth = 53.0;
  double kFloatWidgetHeight = 42.0;
  double kFloatWidgetPadding = 20.0;
  bool moving = false;
  bool byLeft = true;
  bool shareOpen = false;
  List<IconData> shareList;
  Offset offset;
  List<Widget> getShareListWidget() {
    List<Widget> list = [];
    for (int i = 0; i < shareList.length; i++) {
      list.add(
        GestureDetector(
            onTap: () {
              shareOpen ? foldShare() : unfoldShare();
            },
            child: Container(
                width: 30,
                height: 30,
                alignment: FractionalOffset.center,
                decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(15)),
                // child: Text(shareList[i]),
                child: Icon(shareList[i], color: Colors.white, size: 30))),
      );
    }
    return list;
  }

  void foldShare() {
    // 分享按钮收起
    setState(() {
      shareOpen = false;
      offset = byLeft
          ? Offset(offset.dx, offset.dy)
          : Offset(offset.dx + 92, offset.dy);
      kFloatWidgetWidth = 53;
      shareList = [Icons.access_alarm];
    });
  }

  void unfoldShare() {
    // 分享按钮展开
    setState(() {
      shareOpen = true;
      offset = byLeft
          ? Offset(offset.dx, offset.dy)
          : offset = Offset(offset.dx - 92, offset.dy);
      kFloatWidgetWidth = 145;
      shareList = !byLeft
          ? [Icons.access_alarm, Icons.accessibility_new, Icons.add]
          : [Icons.add, Icons.hd, Icons.access_alarm];
    });
  }

  @override
  void initState() {
    super.initState();
    shareList = [Icons.access_alarm];
    offset = Offset(0, kToolbarHeight + 100);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: GestureDetector(
          onPanUpdate: (details) {
            if (shareOpen) return;
            print(details.delta.dx);
            print(details.delta.dy);
            double originX =
                (offset.dx + details.delta.dx) < kFloatWidgetPadding
                    ? kFloatWidgetPadding
                    : (offset.dx + details.delta.dx);
            originX = originX >
                    (MediaQuery.of(context).size.width -
                        kFloatWidgetWidth -
                        kFloatWidgetPadding)
                ? (MediaQuery.of(context).size.width -
                    kFloatWidgetWidth -
                    kFloatWidgetPadding)
                : originX;
            double originY = (offset.dy + details.delta.dy) < 0
                ? 0
                : (offset.dy + details.delta.dy);
            // originY = (offset.dy + details.delta.dy) > 500 ? 500 : (offset.dy + details.delta.dy);
            originY = originY >
                    (MediaQuery.of(context).size.height -
                        kFloatWidgetHeight -
                        180)
                ? (MediaQuery.of(context).size.height -
                    kFloatWidgetHeight -
                    180)
                : originY;
            setState(() {
              offset = Offset(originX, originY);
              kFloatWidgetWidth = 42;
              moving = true;
            });
          },
          onPanEnd: (details) {
            if (shareOpen) return;
            moving = false;
            kFloatWidgetWidth = 53;
            if (offset.dx <
                (MediaQuery.of(context).size.width / 2.0 -
                    kFloatWidgetPadding)) {
              setState(() {
                offset = Offset(0, offset.dy);
                byLeft = true;
              });
            } else {
              setState(() {
                offset = Offset(
                    MediaQuery.of(context).size.width - kFloatWidgetWidth,
                    offset.dy);
                byLeft = false;
              });
            }
          },
          child: GestureDetector(
            onTap: () {
              shareOpen ? foldShare() : unfoldShare();
              // getOffset();
              // print(MediaQuery.of(context).size.height - 180 - kToolbarHeight*2);
            },
            child: Container(
              width: kFloatWidgetWidth,
              height: kFloatWidgetHeight,
              padding: EdgeInsets.only(bottom: 3),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(50, 176, 144, 1),
                  borderRadius: moving
                      ? BorderRadius.circular(25)
                      : byLeft
                          ? BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25))
                          : BorderRadius.only(
                              topLeft: Radius.circular(25),
                              bottomLeft: Radius.circular(25))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: getShareListWidget()),
            ),
          )),
    );
  }
}




//  简单的键盘弹出不顶不遮罩底部视图 （包含自定义键盘控制区域）

// import 'package:flutter/material.dart';
// import 'package:extended_image/extended_image.dart';

// class FeedBackPage extends StatefulWidget {
//   FeedBackPage({Key key}) : super(key: key);

//   _FeedBackPageState createState() => _FeedBackPageState();
// }

// class _FeedBackPageState extends State<FeedBackPage> {
//   TextEditingController nameController = TextEditingController();

//   @override
//   void initState() {
//     nameController.text = '初始昵称12345';
//     super.initState();
//   }
//   @override
//   void dispose() {
//     nameController?.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Color.fromRGBO(247, 247, 247, 1),
//       appBar: AppBar(
//         // backgroundColor: Color.fromRGBO(247, 247, 247, 1),
//            backgroundColor: Colors.lightBlueAccent,
//         elevation: 0,
//       ),
//       body: GestureDetector(
//         behavior: HitTestBehavior.translucent,
//         onTap: () {
//           FocusScope.of(context).requestFocus(FocusNode());
//         },
//         child: Stack(
//           children: <Widget>[
//             // SingleChildScrollView(
//               // physics: NeverScrollableScrollPhysics(), // 1
//               // child:
//               ListView(
//                 children: <Widget>[
//               Container(
//                 color: Colors.redAccent,
//                 width: MediaQuery.of(context).size.width,
//                 // height:  MediaQuery.of(context).size.height- kToolbarHeight,
//                 // height:  MediaQuery.of(context).size.height,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Column(
//                       children: <Widget>[
//                         GestureDetector(
//                           onTap: () {

//                           },
//                           behavior: HitTestBehavior.translucent,
//                           child: Container(
//                             height: 58,
//                             padding: EdgeInsets.only(left: 40),
//                             margin: EdgeInsets.only(bottom: 16),
//                             decoration: BoxDecoration(
//                               color: Colors.white
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(margin: EdgeInsets.only(right: 32), child: Text('修改头像', style: TextStyle(fontSize: 15, color: Color.fromRGBO(50, 50, 50, 1), letterSpacing: 2),)),
//                                 ClipOval(
//                                   child: ExtendedImage.network(
//                                     'https://xszx-test-1251987637.cosbj.myqcloud.com/file/20190614/fe82d65bf5464498b389632f82197983.png',
//                                     cache: true,
//                                     enableLoadState: false,
//                                     fit: BoxFit.fill,
//                                     width: 38,
//                                     height: 38,
//                                   )
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: 82,
//                           padding: EdgeInsets.only(left: 40, right: 40),
//                           margin: EdgeInsets.only(bottom: 16),
//                           decoration: BoxDecoration(
//                             color: Colors.white
//                           ),
//                           child: Stack(
//                             alignment: FractionalOffset.center,
//                             children: <Widget>[
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: <Widget>[
//                                   Container(margin: EdgeInsets.only(right: 32), child: Text('修改昵称', style: TextStyle(fontSize: 15, color: Color.fromRGBO(50, 50, 50, 1), letterSpacing: 2),)),
//                                   Expanded(
//                                     flex: 1,
//                                     child: TextField(
//                                       controller: nameController,
//                                       onSubmitted: (text){
//                                       },
//                                       inputFormatters: [],
//                                       style: TextStyle(fontSize: 15, color: Color.fromRGBO(38, 38, 38, 1), fontWeight: FontWeight.w600, letterSpacing: 2),
//                                       textInputAction: TextInputAction.done,
//                                       cursorColor: Color.fromRGBO(38, 38, 38, .5),
//                                       decoration: InputDecoration(
//                                         counterText: '',
//                                         border: InputBorder.none,
//                                         contentPadding: EdgeInsets.only(top: 4),
//                                       ),
//                                       textAlign: TextAlign.left
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               Positioned(
//                                 left: 0,
//                                 bottom: 5,
//                                 child: Text('只可修改一次', style: TextStyle(fontSize: 12, color: Color.fromRGBO(38, 38, 38, .5), letterSpacing: 2),),
//                               )
//                             ],
//                           )

//                         ),
//                         GestureDetector(
//                           onTap: () {

//                           },
//                           behavior: HitTestBehavior.translucent,
//                           child: Container(
//                             height: 58,
//                             padding: EdgeInsets.only(left: 40),
//                             margin: EdgeInsets.only(bottom: 16),
//                             decoration: BoxDecoration(
//                               color: Colors.white
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(margin: EdgeInsets.only(right: 32), child: Text('修改密码', style: TextStyle(fontSize: 15, color: Color.fromRGBO(50, 50, 50, 1), letterSpacing: 2),))
//                               ],
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: (){
//                             Navigator.pushNamed(context, '/changePhonePwd');
//                           },
//                           behavior: HitTestBehavior.translucent,
//                           child: Container(
//                             height: 58,
//                             padding: EdgeInsets.only(left: 40),
//                             margin: EdgeInsets.only(bottom: 16),
//                             decoration: BoxDecoration(
//                               color: Colors.white
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(margin: EdgeInsets.only(right: 32), child: Text('更换手机号', style: TextStyle(fontSize: 15, color: Color.fromRGBO(50, 50, 50, 1), letterSpacing: 2),)),
//                                 Text('138****9283', style: TextStyle(fontSize: 15, color: Color.fromRGBO(38, 38, 38, 1), letterSpacing: 2, fontWeight: FontWeight.w600),)
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     GestureDetector(
//                       onTap: (){
//                       },
//                       child: Container(
//                         margin: EdgeInsets.only(bottom: 33),
//                         // margin: EdgeInsets.only(bottom: 130),
//                         padding: EdgeInsets.only(left: 40, right: 40),
//                         child: Container(
//                           height: 44,
//                           alignment: FractionalOffset.center,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(22),
//                             color: Color.fromRGBO(50, 50, 50, 1),
//                             boxShadow: [BoxShadow(blurRadius: 10, color: Color.fromRGBO(0, 0, 0, 0.25), offset: Offset(0, 4), spreadRadius: 2)],
//                           ),
//                           child: Text('退出登录', style: TextStyle(fontSize: 15, color: Color.fromRGBO(255, 255, 255, 1), letterSpacing: 2, fontWeight: FontWeight.w600),)
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//              ],
//             ),

//             // ),

//             Positioned(
//               bottom: 0,
//               child: GestureDetector(
//                 onTap: () {
//                   FocusScope.of(context).requestFocus(FocusNode());
//                 },
//                 child: Container(
//                   height: 30,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     color: Colors.black
//                   )
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }