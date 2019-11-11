
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

class FlutterChannelPlugin {
  
  static const MethodChannel _methodchannel = const MethodChannel('com.sunlands.your/flutter_method_channel');
  static const EventChannel _eventchannel = const EventChannel('flutter_event_channel');

  String mResult;
  Function(String) mFunction;

  StreamController<String> _responseController = StreamController<String>.broadcast();
  Stream<String> get responseStream => _responseController.stream;

  void init(Function(String) func) {
    _eventchannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
    mFunction = func;
  }

  void _onEvent(Object event) {
    mResult = event.toString();
    // print('---------event----------');
    // print(event);
    if (mFunction != null) {
      mFunction(event);
    }
    _responseController.add(event);
  }

  void _onError(Object error) {
    mResult = error.toString();
    // print('---------error----------');
    // print(error);
    if (mFunction != null) {
      mFunction(error);
    }
    _responseController.add(error);
  }

// -------------- 跳转原生页面  -------------- //
  static Future<void> toNativePage(int bannertype, int classtype, String params) async {
    await _methodchannel.invokeMethod('homepage',{'bannertype': bannertype, 'classtype': classtype, 'params': params});
  }

  //  我的课程
  static Future<void> myCoursesList(int iscourse, String coid, String goid) async {
    await _methodchannel.invokeMethod('mycourseslist', {'iscourse': iscourse, 'coid': coid, 'goid': goid});
  }

// -------------- 跳转H5页面  -------------- //
  static Future<void> toAdPage(String link, int bannertype) async {
    await _methodchannel.invokeMethod('homepage', {'link': link, 'bannertype': bannertype});
  }

  // 若需从调用方法这里获取到同步获取返回值
  // 在原生侧，直接利用  result(@"fweer"); 返回值
  static Future<String> toStringPageback(String link, int bannertype) async {
   var resultData = await _methodchannel.invokeMethod('homepage', {'link': link, 'bannertype': bannertype});
   return json.decode(resultData);
  }

}

