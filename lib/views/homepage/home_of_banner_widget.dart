import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterkeepgoing/blocs/home_of_banner_bloc.dart';
import 'package:flutterkeepgoing/models/homepage_model.dart';
import 'package:flutterkeepgoing/net/base_response.dart';
import 'package:flutterkeepgoing/util/screen_util.dart';
import 'package:flutterkeepgoing/widgets/loading.dart';

class HomeOfBannerWidget extends StatefulWidget {

  @override
  _HomeOfBannerWidgetState createState() => _HomeOfBannerWidgetState();
}

class _HomeOfBannerWidgetState extends State<HomeOfBannerWidget>{


  HomeOfBannerBloc _bloc = new HomeOfBannerBloc();
  List<HomeOfBannerModel> indexBannerList = [];

  _getIndexBanner() {
    Map<String, String> params = {'type': '1'};
    _bloc.getHomeOfBannerList(params);
  }

  @override
  void initState() {
    super.initState();
    _getIndexBanner();
  }

  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder<BaseResp>(
        stream: _bloc.homeOfBannerStream,
        builder: (context, AsyncSnapshot<BaseResp> snapshot) {
          if (snapshot.data != null && snapshot.hasData) {
            var response = snapshot.data;
            if (response.result == true && response.data.length > 0) {
              indexBannerList = response.data;
              if (indexBannerList.length > 1) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 17.0),
                  child: AspectRatio(
                    aspectRatio: 10.0 / 3.46,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: ExtendedImage.network(
                              indexBannerList[index].picture,
                              cache: true,
                              enableLoadState: false,
                              fit: BoxFit.fill),
                        );
                      },
                      itemCount: indexBannerList.length,
                      autoplay: true,
                      duration: 500,
                      pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            color: Colors.blue[600],
                            activeColor: Colors.white,
                            space: 5,
                            size: 8.0,
                            activeSize: 8.0),
                      ),
                      onTap: (index) {
                        if (indexBannerList[index].linkType == 1) {
                          //传index.url 完整链接 ，true 为开启埋点统计 ，埋点ID ，bannertype类型为1代表跳转webview
                          toWebview(
                            indexBannerList[index].linkUrl,
                            1,
                          );
                        } else if (indexBannerList[index].linkType == 2) {
                          // String router = indexBannerList[index].router.split('?')[0];
                          String classtype = indexBannerList[index]
                              .router
                              .split('?')[1]
                              .split('=')[0];
                          String params = indexBannerList[index]
                              .router
                              .split('?')[1]
                              .split('=')[1];

                          if (classtype == 'openClassId') {
                            // 传bannertype类型为2代表跳转原生页 ，classtype类型为1代表公开课，传参数openClassId
                          } else if (classtype == 'goId') {
                            // 传bannertype类型为2代表跳转原生页 ，classtype类型为2代表付费课，传参数goId
                          }
                        }
                      },
                    ),
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    // print('banner');
                    if (indexBannerList[0].linkType == 1) {
                      toWebview(
                        indexBannerList[0].linkUrl,
                        1,
                      );
                    } else if (indexBannerList[0].linkType == 2) {
                      String classtype =
                          indexBannerList[0].router.split('?')[1].split('=')[0];
                      String params =
                          indexBannerList[0].router.split('?')[1].split('=')[1];
                      if (classtype == 'openClassId') {
                        // 传类型为1 的公开课详情页 ，传参数openClassId
                      } else if (classtype == 'goId') {
                        // 传类型为2 的付费课详情页 ，传参数goId
                      }
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: AspectRatio(
                        aspectRatio: 10.0 / 3.46,
                        child: ExtendedImage.network(
                          indexBannerList[0].picture,
                          cache: true,
                          enableLoadState: false,
                          fit: BoxFit.fill,
                          height: ScreenUtil().setHeight(122),
                        ),
                      ),
                    ),
                  ),
                );
              }
            } else {
              return Container();
            }
          } else {
              return Container();
          }
        });
  }
}

// 跳转广告位 webview
void toWebview(String link, int bannertype) async {}
