import 'package:flutter/material.dart';
import 'package:flutterkeepgoing/common/dimens.dart';
import 'package:flutterkeepgoing/util/image_utils.dart';
import 'package:flutterkeepgoing/util/toast.dart';
import 'package:flutterkeepgoing/views/homepage/home_page.dart';
import 'package:flutterkeepgoing/views/minecoursepage/minecourse_page.dart';
import 'package:flutterkeepgoing/views/minepage/mine_page.dart';


class TabbarController extends StatefulWidget {
  @override
  _TabbarControllerState createState() => _TabbarControllerState();
}

class _TabbarControllerState extends State<TabbarController> {
  int _tabIndex = 0;
  var _pageList;
  var _tabImages;
  var _appBarTitles = ['首页', '我的课程', '我的'];
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() {
    _pageList = [
      HomePage(),
      MineCoursePage(),
      MinePage()
    ];

    _tabImages = [
      [
        loadAssetImage("home/2.0x/icon_home_n", width: 24.0, height: 24.0),
        loadAssetImage("home/2.0x/icon_home_s", width: 24.0, height: 24.0),
      ],
      [
        loadAssetImage("mycourise/2.0x/icon_minecourse_n",width: 24.0, height: 24.0),
        loadAssetImage("mycourise/2.0x/icon_minecourse_s",width: 24.0, height: 24.0),
      ],
      [
        loadAssetImage("mine/2.0x/icon_mine_n", width: 24.0, height: 24.0),
        loadAssetImage("mine/2.0x/icon_mine_s", width: 24.0, height: 24.0),
      ],
    ];
  }

  Image _getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return _tabImages[curIndex][1];
    }
    return _tabImages[curIndex][0];
  }

  Widget _buildTabText(int curIndex) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Text(_appBarTitles[curIndex]),
    );
  }

  DateTime _lastTime;

  Future<bool> _isExit() {
    if (_lastTime == null ||
        DateTime.now().difference(_lastTime) > Duration(milliseconds: 2500)) {
      _lastTime = DateTime.now();
      Toast.show("再次点击退出应用");
      return Future.value(false);
    }
    Toast.cancelToast();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _isExit,
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            items: List.generate(
                _appBarTitles.length,
                (i) => BottomNavigationBarItem(
                    icon: _getTabIcon(i), title: _buildTabText(i))),
            type: BottomNavigationBarType.fixed,
            currentIndex: _tabIndex,
            elevation: 5.0,
            iconSize: 21.0,
            selectedFontSize: Dimens.font_sp14,
            unselectedFontSize: Dimens.font_sp14,
            selectedItemColor: Color(0xFF333333),
            unselectedItemColor: Color(0xffbfbfbf),
            onTap: (index) {
              _pageController.jumpToPage(index);
            },
          ),
          // 使用PageView的原因参看 https://zhuanlan.zhihu.com/p/58582876
          body: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _pageList,
            physics: NeverScrollableScrollPhysics(), // 禁止滑动
          )),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _tabIndex = index;
    });
  }
}
