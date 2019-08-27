import 'dart:async';
import 'package:flutterkeepgoing/models/homepage_model.dart';
import 'package:flutterkeepgoing/net/base_response.dart';
import 'package:flutterkeepgoing/provider/homepage_provider.dart';

class HomeOfBannerBloc {
  final _apiClient = HomePageProvider();

  StreamSubscription<BaseResp> _homeOfBannerSubscription;
  final StreamController<BaseResp> _homeOfBannerController = StreamController<BaseResp>.broadcast();
  Stream<BaseResp> get homeOfBannerStream => _homeOfBannerController.stream;


  void getHomeOfBannerList(params) {
    _homeOfBannerSubscription?.cancel();
    _homeOfBannerSubscription = _apiClient
        .getHomeOfBannerData(params)
        .asStream()
        .listen((BaseResp data) {
      if (data.result) {
        data.data = (data.data as List)
            .map((value) => HomeOfBannerModel.fromJson(value))
            .toList();
      }
      _homeOfBannerController.add(data);
    });
  }

  void dispose() {
    _homeOfBannerSubscription?.cancel();
    _homeOfBannerController.close();
  }
}
