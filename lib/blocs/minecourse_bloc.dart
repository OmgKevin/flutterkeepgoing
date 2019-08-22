import 'dart:async';

import 'package:flutterkeepgoing/models/minecourse_model.dart';
import 'package:flutterkeepgoing/net/base_response.dart';
import 'package:flutterkeepgoing/provider/minecourse_provider.dart';

class MineCourseListBloc {

  // 初始化请求方法
  final provider = MineCoursePageApiProvider();

   /*
   * 数据流取数据 3 部曲
   *
   */
  // 声明数据流
  StreamSubscription<BaseResp> _mineCourseListSubcrition;
  // 监听数据流
  final StreamController<BaseResp> _mineCourseController = StreamController<BaseResp>.broadcast();
  // 用流返回的数据
  Stream<BaseResp> get mineCourseList => _mineCourseController.stream;



  void getList (params) {
    // 数据异常 => cancel
    _mineCourseListSubcrition?.cancel();

    _mineCourseListSubcrition = provider.getList(params).asStream().listen((BaseResp data) {
      if (data.result) {
        data.data = MineCourseModel.fromJson(data.data);
      }
      _mineCourseController.add(data);
    });
  }
  // CANCEL 销毁控制器
  void dispose() {
    _mineCourseListSubcrition?.cancel();
    _mineCourseController.close();
  }
}
