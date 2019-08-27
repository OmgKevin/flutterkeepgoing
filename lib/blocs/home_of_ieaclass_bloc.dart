import 'dart:async';

import 'package:flutterkeepgoing/models/homepage_model.dart';
import 'package:flutterkeepgoing/net/base_response.dart';
import 'package:flutterkeepgoing/provider/homepage_provider.dart';


class HomeOfIEAClassBloc {

  final _apiClient = HomePageProvider();

  StreamSubscription<BaseResp> _homeOfIEAClassSubscription;
  final StreamController<BaseResp> _homeOfIEAClassController = StreamController<BaseResp>.broadcast();
  Stream<BaseResp> get homeOfIEAClassStream => _homeOfIEAClassController.stream;

  void getHomeOfIEAClassList([params]) {
    _homeOfIEAClassSubscription?.cancel();
    _homeOfIEAClassSubscription = _apiClient
        .getHomeOfIEAClassData(params)
        .asStream()
        .listen((BaseResp data) {
      if (data.result) {
        data.data = (data.data as List)
            .map((value) => HomeOfIEAClassModel.fromJson(value))
            .toList();
      }
      _homeOfIEAClassController.add(data);
    });
  }

  void dispose() {
    _homeOfIEAClassSubscription?.cancel();
    _homeOfIEAClassController.close();
  }
}