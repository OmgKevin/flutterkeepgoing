import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterkeepgoing/blocs/home_of_ieaclass_bloc.dart';
import 'package:flutterkeepgoing/models/homepage_model.dart';
import 'package:flutterkeepgoing/net/base_response.dart';
import 'package:flutterkeepgoing/util/screen_util.dart';

class HomeOfIEAClassWidget extends StatefulWidget {
  @override
  _HomeOfIEAClassWidgetState createState() => _HomeOfIEAClassWidgetState();
}

class _HomeOfIEAClassWidgetState extends State<HomeOfIEAClassWidget> {
  HomeOfIEAClassBloc _bloc = new HomeOfIEAClassBloc();
  bool visible = true;

  List<HomeOfIEAClassModel> indexMenuClassList = [];
  _getIndexBanner() {
    _bloc.getHomeOfIEAClassList();
  }

  @override
  void initState() {
    super.initState();

    _getIndexBanner();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    return StreamBuilder<BaseResp>(
        stream: _bloc.homeOfIEAClassStream,
        builder: (context, AsyncSnapshot<BaseResp> snapshot) {
          if (snapshot.data != null && snapshot.hasData) {
            var response = snapshot.data;
            if (response.result == true && response.data.length > 0) {
              indexMenuClassList = response.data;
              return Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 21.0, left: 17.0),
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: Color.fromRGBO(247, 247, 247, 1),
                                width: 10.0))),
                    child: Text(
                      'IEA认证项目',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color.fromRGBO(25, 25, 25, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (indexMenuClassList[0].linkType == '1') {
                        // 取URL跳转webview,暂未处理
                        String h5url = indexMenuClassList[0].h5Url;
                      } else if (indexMenuClassList[0].linkType == '2') {
                        // 取goid 跳转 付费课产品包
                        String classtype = indexMenuClassList[0]
                            .pageUrl
                            .split('?')[1]
                            .split('=')[0];
                        String params = indexMenuClassList[0]
                            .pageUrl
                            .split('?')[1]
                            .split('=')[1];

                        if (classtype == 'openClassId') {
                        } else if (classtype == 'goId') {}
                      }
                    },
                    child: indexMenuClassList[0].bannerUrl == '' ||
                            indexMenuClassList[0].bannerUrl == null
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.only(
                                top: 10.0, left: 17.0, right: 17.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: AspectRatio(
                                  aspectRatio: 10.0 / 3.46,
                                  child: ExtendedImage.network(
                                    indexMenuClassList[0].bannerUrl,
                                    cache: true,
                                    enableLoadState: false,
                                    fit: BoxFit.fill,
                                  ),
                                )),
                          ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: indexMenuClassList.length,
                        padding: EdgeInsets.only(top: 0),
                        physics: ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return listItem(indexMenuClassList[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 1.0,
                            margin: EdgeInsets.symmetric(horizontal: 17),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(245, 245, 245, 1)),
                          );
                        }),
                  ),
                ],
              );
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        });
  }

  // IEA认证项目
  Widget listItem(item) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(color: null),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 17.0, top: 17.0, bottom: 17.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Container(
                    width: 149.0,
                    height: 81.0,
                    child: ExtendedImage.network(
                      item.gdCover,
                      cache: true,
                      enableLoadState: false,
                      fit: BoxFit.fill,
                    ),

                    // child: FadeInImage.memoryNetwork(
                    //   placeholder: kTransparentImage,
                    //   image: item.gdCover,
                    //   fit: BoxFit.fill,
                    // ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 200.0,
                    height: 48.0,
                    margin: EdgeInsets.all(15),
                    child: Text(
                      item.goName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Color.fromRGBO(25, 25, 25, 1),
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 15.0)),
                      visible
                          ? Text(
                              item.discountPrice == null
                                  ? '￥' + item.price
                                  : '￥' + item.discountPrice,
                              style: TextStyle(
                                  color: Color.fromRGBO(254, 100, 0, 1),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(''),
                      Padding(padding: EdgeInsets.only(left: 10.0)),
                      visible
                          ? Text(
                              item.discountPrice == null
                                  ? ''
                                  : '￥' + item.price,
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Color.fromRGBO(151, 151, 151, 1),
                                  fontSize: 15.0),
                            )
                          : Text(''),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
