
import 'dart:async';

import 'package:flutterkeepgoing/models/homepage_model.dart';
import 'package:flutterkeepgoing/net/base_response.dart';
import 'package:flutterkeepgoing/provider/homepage_provider.dart';

class HomeOfOpenClassBloc {
  final _apiClient = HomePageProvider();

  StreamSubscription<BaseResp> _homeOfOpenClassSubscription;
  final StreamController<BaseResp> _homeOfOpenClassController = StreamController<BaseResp>.broadcast();
  Stream<BaseResp> get homeOfOpenClassStream => _homeOfOpenClassController.stream;

  /*
  *  获取公开课类型列表
  * @links
  */
  void getopenClassList(params) {
    _homeOfOpenClassSubscription?.cancel();
    _homeOfOpenClassSubscription = _apiClient
        .getHomeOfOpenClassData(params)
        .asStream()
        .listen((BaseResp data) {
      if (data.result) {
        data.data = (data.data as List)
            .map((value) => HomeOfOpenClassModel.fromJson(value))
            .toList();
      }
      _homeOfOpenClassController.add(data);
    });
  }

  void dispose() {
    _homeOfOpenClassSubscription?.cancel();
    _homeOfOpenClassController.close();
  }
}
