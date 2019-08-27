import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterkeepgoing/blocs/home_of_openclass_bloc.dart';
import 'package:flutterkeepgoing/models/homepage_model.dart';
import 'package:flutterkeepgoing/net/base_response.dart';



class HomeOfOpenClassListWidget extends StatefulWidget {

  @override
  _HomeOfOpenClassListWidgetState createState() => _HomeOfOpenClassListWidgetState();
}

class _HomeOfOpenClassListWidgetState extends State<HomeOfOpenClassListWidget> {

  HomeOfOpenClassBloc _bloc = new HomeOfOpenClassBloc();
  List<HomeOfOpenClassModel> indexClassList = [];
 
  _getIndexBanner() {
    Map<String, String> params = {'type': '2'};
    _bloc.getHomeOfOpenClassList(params);
  }
 

  _dot(val) {
    final count = val.indexOf('.') > 0 ? '万' : '';
    return val + count;
  }

  @override
  void initState() {
    super.initState();
     _getIndexBanner();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BaseResp>(
        stream: _bloc.homeOfOpenClassStream,
        builder: (context, AsyncSnapshot<BaseResp> snapshot) {
          if (snapshot.data != null && snapshot.hasData) {
            var response = snapshot.data;
            if (response.result == true && response.data.length > 0) {
              indexClassList = response.data;
              
              return Container(
                height: 136.0,
                margin: EdgeInsets.only(top: 19.0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: indexClassList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return listItem(indexClassList[index], index);
                    }),
              );
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        });
  }

  // 横向滑动列表
  Widget listItem(item, index) {
    return Container(
      width: 156.0,
      margin: EdgeInsets.only(
          left: index == 0 ? 17.0 : 4.5,
          right: indexClassList.length - 1 == index ? 17.0 : 4.5),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(3.0),
              child: Container(
                width: 149.0,
                height: 81.0,
                 child: ExtendedImage.network(
                            item.bannerUrl != null ? item.bannerUrl : 'https://xszx-test-1251987637.cos.ap-beijing.myqcloud.com/flutter/images/courseDefault.png',
                            cache: true,
                            enableLoadState: false,
                            fit: BoxFit.fill,
                        ),
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  item.learnerCount == null
                      ? ''
                      : _dot(item.learnerCount) + '次',
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Color.fromRGBO(254, 100, 0, 1),
                      fontWeight: FontWeight.bold,
                      height: 2.4),
                ),
                Padding(padding: EdgeInsets.only(left: 8.0)),
                Text(
                  item.learnerCount == null ? '' : '学习',
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Color.fromRGBO(158, 158, 158, 1),
                      fontWeight: FontWeight.bold,
                      height: 2.4),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

