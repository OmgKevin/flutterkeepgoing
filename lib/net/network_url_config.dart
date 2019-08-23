import 'base_api_config.dart';

class NetworkConfig {
  static final hostUrl = ApiConfig.hostUrl;
  static final platFormHost = ApiConfig.platFormHost;
  static final isProd = ApiConfig.isProd;
  static final authKey = ApiConfig.authKey;

 static final Map<String, String> homePageApi = {
    'getIndexBanner': hostUrl + 'index/getIndexBanner',
    'indexMenuClassList': hostUrl + 'index/indexMenuClass/list',
    'openClassList': hostUrl + 'index/openClass/list',
  };
  

  static final Map<String, String> minePageApi = {
    'getOpenClassTypeList': hostUrl + 'index/project',
    'openClassList': hostUrl + 'index/openClass',
  };
  
  static final Map<String, String> mineCoursePageApi = {
    'getList':  hostUrl + 'course/courseList',
  };

  static final Map<String, String> appVersionLimit = {
    'appVersionLimit':  hostUrl + 'appVersion/limit',
  };

}
