import 'package:device_info/device_info.dart';
import 'package:flutterkeepgoing/common/key_config.dart';
import 'package:flutterkeepgoing/net/base_api_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

final WebViewUrlConfig fullUrlConfig = new WebViewUrlConfig();

class WebViewUrlConfig {

  fullurl(String urlstring) async {
    String detail = ApiConfig.h5baseurl;
    String openClassId = urlstring;
    String authorization ='Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTdW5MYW5kIiwiYXVkIjoiMTc2MjAzNTYzMDMiLCJpYXQiOjE1NjcxNTExMDQsInN1YiI6IjE3NjIwMzU2MzAzLVtdIiwiZXhwIjoxNTY3MTUxMTA0fQ.H8GUoiFw4p7F1Vgv7b1z0QlgW-oS54u1fy9_Ghzo7oY';
    String a = 'MTc2MjAzNTYzMDM=';
    String deviceId = await getdeviceID();

    String webUrl = (detail +'detail?' +'openClassId=' +openClassId +'&Authorization=' +authorization +'&a=' +a +'&deviceId=' +deviceId).replaceAll(RegExp('\\s+'), '');// 正则去除空格

    return webUrl;
  }

  getdeviceID() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    var data = await deviceInfo.iosInfo;
    String identifier = data.identifierForVendor;
    return identifier;
  }

}
