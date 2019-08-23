import 'package:flutterkeepgoing/net/base_api_provider.dart';
import 'package:flutterkeepgoing/net/base_response.dart';
import 'package:flutterkeepgoing/net/network_url_config.dart';

class HomePageProvider extends BaseApiProvider {

  // 首页广告图
  Future<BaseResp> getHomeOfBannerData(Map<String, dynamic> params) async {
    final response = await post(NetworkConfig.homePageApi['getIndexBanner'], params);
    return super.verifyMiddleWare(response);
  }


   // 试听课/公开课
  Future<BaseResp> getHomeOfOpenClassData(Map<String, dynamic> params) async {
    final response = await get(NetworkConfig.homePageApi['openClassList'], params);
    return super.verifyMiddleWare(response);
  }
 
 

}