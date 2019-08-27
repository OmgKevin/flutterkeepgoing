import 'package:flutterkeepgoing/net/base_api_provider.dart';
import 'package:flutterkeepgoing/net/base_response.dart';
import 'package:flutterkeepgoing/net/network_url_config.dart';

class MineCoursePageProvider extends BaseApiProvider {
  /*
  *  获取我的课程列表
  * @links
  */
  Future<BaseResp> getList(Map<String, dynamic> params) async {
    final response = await get(NetworkConfig.mineCoursePageApi['getList'], params);
    return super.verifyMiddleWare(response);
  }
}