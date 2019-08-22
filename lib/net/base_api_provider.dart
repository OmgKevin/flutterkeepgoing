import 'dart:async';
import 'package:flutterkeepgoing/common/key_config.dart';
import 'package:flutterkeepgoing/util/date_util.dart';
import 'package:flutterkeepgoing/util/sign_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_response.dart';
import 'package:dio/dio.dart';


class BaseApiProvider {
  Dio dio = new Dio();
  SharedPreferences _sharedPreferences;


  BaseApiProvider() {
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      
      String timestamp = DateUtils.getNowDateMs().toString(); // 获取当前时间戳
      if (options.method == "POST") {
        options.data['timestamp'] = timestamp;
        String sign = httpUtil.sortMap(options.data);
        options.data['sign'] = sign;
      } else {
        options.queryParameters['timestamp'] = timestamp;
        // 创建sign
        String sign = httpUtil.sortMap(options.queryParameters);
        options.queryParameters['sign'] = sign;
      }

      // 缓存获取token
      String authorization =await _getSharedPerfencesString(Keys.authorization);
      String a = await _getSharedPerfencesString(Keys.a);

      if (null != authorization &&authorization.isNotEmpty &&null != a &&a.isNotEmpty) {
        options.headers['Authorization'] = authorization;
        options.headers['a'] = a;
      }

      return options;

    }, 
    onResponse: (Response response) {
      return response;
    }, 
    onError: (DioError e) {

      // token --- 401 需要重新登陆
      if(e.response != null && e.response.statusCode == 401){

      }
      return _onError(e);
    }));
  }

  post(url, [var params]) {
    Completer completer = Completer();
    dio.post(url, data: params).then((res) {
      completer.complete(res);
    }).catchError((error) {
      completer.complete(error);
    });
    return completer.future;
  }

  static const Map<String, dynamic> initParams = {};

  get(url, [var params = initParams]) {
    Completer completer = Completer();
    dio.get(url, queryParameters: params).then((res) {
      completer.complete(res);
    }).catchError((error) {
      completer.complete(_handleError(error));
    });
    return completer.future;
  }

  verifyMiddleWare(dynamic temp) {
    if (temp is Response) {
      final res = temp.data;
      if (200 == res['code'] || '200' == res['code']) {
        if (res['code'] is String) {
          return BaseResp(
              code: int.parse(res['code']),
              msg: res['msg'],
              result: true,
              data: res['data']);
        } else {
          return BaseResp(
              code: res['code'],
              msg: res['msg'],
              result: true,
              data: res['data']);
        }
      } else {
        return BaseResp(code: res['code'], msg: res['msg'], result: false);
      }
    } else {
      return temp;
    }
  }

  _handleError(DioError error) {
    String errorDescription = "";
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
              "Received invalid status code: ${error.response.statusCode}";
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "SEND_TIMEOUT";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }

    return Response(data: {
      "code": CustomRespCode.networkFail,
      "result": false,
      "data": errorDescription
    });
  }

  Future _onError(DioError error) {
    Completer completer = Completer();
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.CANCEL:
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          break;
        case DioErrorType.DEFAULT:
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          break;
        case DioErrorType.RESPONSE:
          break;
        case DioErrorType.SEND_TIMEOUT:
          break;
      }
    }
    return completer.future;
  }

  _getSharedPerfencesString(String key) async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
    String account = _sharedPreferences.getString(Keys.account) ?? "default";
    return _sharedPreferences.get(key + account) ?? "";
  }
}
