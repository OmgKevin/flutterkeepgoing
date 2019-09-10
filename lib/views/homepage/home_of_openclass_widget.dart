import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterkeepgoing/blocs/home_of_openclass_bloc.dart';
import 'package:flutterkeepgoing/models/homepage_model.dart';
import 'package:flutterkeepgoing/net/base_response.dart';
import 'package:flutterkeepgoing/routers/fluro_navigator.dart';
import 'package:flutterkeepgoing/util/webview_url_config_util.dart';

class HomeOfOpenClassWidget extends StatefulWidget {
  @override
  _HomeOfOpenClassWidgetState createState() => _HomeOfOpenClassWidgetState();
}

class _HomeOfOpenClassWidgetState extends State<HomeOfOpenClassWidget> {
  HomeOfOpenClassBloc _bloc = new HomeOfOpenClassBloc();
  List<HomeOfOpenClassModel> indexOpenList = [];

  _getIndexBanner() {
    Map<String, String> params = {'type': '1'};
    _bloc.getHomeOfOpenClassList(params);
  }

  @override
  void initState() {
    super.initState();
    _getIndexBanner();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BaseResp>(
      stream: _bloc.homeOfOpenClassStream,
      builder: (context, AsyncSnapshot<BaseResp> snapshot) {
        if (snapshot.data != null && snapshot.hasData) {
          var response = snapshot.data;
          if (response.result == true && response.data.length > 0) {
            indexOpenList = response.data;
            return Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 13.0, left: 17.0, right: 17.0),
                  child: Text(
                    '试听课',
                    style: TextStyle(
                        color: Color.fromRGBO(25, 25, 25, 1),
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    // NavigatorUtils.push(context,HomePageRouter.openClassPage);

                    String webUrl = await fullUrlConfig.fullurl(indexOpenList[0].openClassId.toString());
                    NavigatorUtils.goWebViewPage(context, "详情", webUrl);

                  },
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 14.0, left: 17.0, right: 17.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: AspectRatio(
                          aspectRatio: 10.0 / 4.63,
                          child: ExtendedImage.network(
                            indexOpenList[0].bannerUrl,
                            cache: true,
                            enableLoadState: false,
                            fit: BoxFit.fill,
                          ),
                        )),
                  ),
                ),
              ],
            );
          } else {
            return Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 13.0, left: 17.0, right: 17.0),
              child: Text(
                '试听课',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
            );
          }
        } else {
          return Container();
        }
      },
    );
  }
}
