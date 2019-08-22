import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

final HttpUtil httpUtil = new HttpUtil();

class HttpUtil {
  sortMap(Map map) {
    List list = new List();
    map.forEach((k, v) {
      list.add(k + "=" + v + "&");
    });
    return sort(list);
  }

  sort(List list) {
    list.sort((a, b) {
      List<int> al = a.codeUnits;
      List<int> bl = b.codeUnits;
      for (int i = 0; i < al.length; i++) {
        if (bl.length <= i) return 1;
        if (al[i] > bl[i]) {
          return 1;
        } else if (al[i] < bl[i]) return -1;
      }
      return 0;
    });
    print(list.toString());
    StringBuffer buffer = new StringBuffer();
    for (String temp in list) {
      buffer.write(temp);
    }
    String sign = buffer.toString().substring(0, buffer.toString().length - 1);
    print(sign);
    return generateMd5(sign);
  }

  String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }
}
