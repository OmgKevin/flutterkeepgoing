# flutterkeepgoing

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### Flutter 数据存储  [SpUtil](https://github.com/Sky24n/flustars)
单例"同步" SharedPreferences 工具类。  
支持get获取默认参数、支持存储实体对象、支持存储实体对象数组。
```dart
    // 等待Sp初始化完成。
    await SpUtil.getInstance();
    
    SpUtil.getString('key', defValue: '');
    SpUtil.getInt('key', defValue: 0);
  
    /// save object example.
    /// 存储实体对象示例。
    City city = new City();
    city.name = "成都市";
    SpUtil.putObject("loc_city", city);
  
    City hisCity = SpUtil.getObj("loc_city", (v) => City.fromJson(v)); 
    print("thll Str: " + (hisCity == null ? "null" : hisCity.toString()));
  
    /// save object list example.
    /// 存储实体对象List示例。
    List<City> list = new List();
    list.add(new City(name: "成都市"));
    list.add(new City(name: "北京市"));
    SpUtil.putObjectList("loc_city_list", list);
  
    List<City> _cityList = SpUtil.getObjList("loc_city_list", (v) => City.fromJson(v));
    print("thll List: " + (_cityList == null ? "null" : _cityList.toString()));
```
