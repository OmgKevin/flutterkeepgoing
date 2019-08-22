/// <BaseResp<T> 返回 code msg data.
class BaseResp<T> {
  int code;
  String msg;
  bool result;
  T data;

  BaseResp({int code, String msg, bool result, T data}) {
    this.code = code;
    this.msg = msg;
    this.result = result;
    if (null != data) {
      this.data = data;
    }
  }

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write(",\"code\":$code");
    sb.write(",\"msg\":$msg");
    sb.write(",\"result\":$result");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}

class CustomRespCode {
  static int networkFail = 4000001;
  static int networkSuccess = 4000002;
}