import 'package:flutterkeepgoing/net/base_api_provider.dart';
import 'package:flutterkeepgoing/net/base_response.dart';
import 'package:flutterkeepgoing/net/network_url_config.dart';
import 'package:flutterkeepgoing/routers/fluro_navigator.dart';
import 'package:flutterkeepgoing/routers/router_init.dart';

class MineCoursePageProvider extends BaseApiProvider {
  /*
  *  获取我的课程列表
  * @links
  */
  Future<BaseResp> getMineCourseListData(Map<String, dynamic> params,context) async {
    final response = await get(NetworkConfig.mineCoursePageApi['getList'], params);
    
    if(response != null && response.data['code'] == 4000001){
       print('------------ $response');
       NavigatorUtils.push(context,MyPageRouter.accountInfoPage);
    }
    
    return super.verifyMiddleWare(response);
  }
}