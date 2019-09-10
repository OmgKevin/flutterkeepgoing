import 'package:flutter/material.dart';
import 'package:flutterkeepgoing/blocs/minecourse_bloc.dart';
import 'package:flutterkeepgoing/common/app_bar.dart';
import 'package:flutterkeepgoing/common/key_config.dart';
import 'package:flutterkeepgoing/models/minecourse_model.dart';
import 'package:flutterkeepgoing/net/base_response.dart';
import 'package:flutterkeepgoing/util/shared_util.dart';
import 'package:flutterkeepgoing/views/minecoursepage/minecourse_listitem.dart';
import 'package:flutterkeepgoing/widgets/progress_dialog.dart';

class MineCoursePage extends StatefulWidget {
  MineCoursePage({Key key}) : super(key: key);

  @override
  _MineCoursePageState  createState() => _MineCoursePageState();
}

class _MineCoursePageState extends State<MineCoursePage>
    with
        WidgetsBindingObserver,
        AutomaticKeepAliveClientMixin<MineCoursePage>,
        SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  MineCourseListBloc _bloc = new MineCourseListBloc();
  List<PurchasedCourse> mineCourseList = [];
  String userid = '468';

  @override
  void initState() {
    super.initState();
      
      _initAsync();

       String userauthorization = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTdW5MYW5kIiwiYXVkIjoiMTc2MjAzNTYzMDMiLCJpYXQiOjE1NjgwODExOTAsInN1YiI6IjE3NjIwMzU2MzAzLVtdIiwiZXhwIjoxNTY4MDgxMTkwfQ.mDVzUqzY5ZUVYCY7m6y7aFvwJJxZ6s6AZuZVvBfeIpQ';
       String usera = 'MTc2MjAzNTYzMDM=';

       SpUtil.putString(Keys.authorization, userauthorization);
       SpUtil.putString(Keys.a, usera);

       _getList();

    WidgetsBinding.instance.addObserver(this);
  }


  void _initAsync() async {
    await SpUtil.getInstance();
  }

  _getList() {
    Map<String, String> paramsmap = {'id': userid};
    _bloc.getMineCourseList(paramsmap,context);
  }

  Future<Null> _refresh() async {
    // mineCourseList.clear();
    await _getList();
    return;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BaseResp>(
      stream: _bloc.mineCourseStream,
      builder: (BuildContext context, AsyncSnapshot<BaseResp> snapshot) {
        if (snapshot.data != null && snapshot.hasData) {
          var response = snapshot.data;
          if (response.result == true && response.data != null) {
            mineCourseList = response.data.purchasedCourses;
            if (mineCourseList.length == 0) {
              return RefreshIndicator(
                onRefresh: _refresh,
                child: Scaffold(
                    appBar: MyAppBar(
                      centerTitle: "我的课程",
                      isBack: false,
                    ),
                    body: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.network(
                              'https://xszx-test-1251987637.cos.ap-beijing.myqcloud.com/flutter/images/noCourse.png',
                              width: 198,
                              height: 182),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 30),
                            child: Text('您还没有选课，去首页选课进入学习吧！',
                                style: TextStyle(
                                    color: Color.fromRGBO(153, 153, 153, 1),
                                    fontSize: 13)),
                          )
                        ],
                      ),
                    )),
              );
            } else {
              return Scaffold(
                appBar: MyAppBar(
                      centerTitle: "我的课程",
                      isBack: false,
                    ),
                  body: RefreshIndicator(
                onRefresh: _refresh,
                child: Container(
                    color: Colors.white,
                    child: ListView.separated(
                      itemCount: mineCourseList.length,
                      itemBuilder: (context, index) {
                        return MineCourseListItem(map: mineCourseList[index]);
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          height: 10,
                          color: Color.fromRGBO(247, 247, 247, 1),
                        );
                      },
                    )),
              ));
            }
          } else {
            // return LoadingPage();
            return ProgressDialog(hintText: "正在加载...");
          }
        } else {
          // return LoadingPage();
           return ProgressDialog(hintText: "正在加载...");
        }
      },
    );
  }
}
