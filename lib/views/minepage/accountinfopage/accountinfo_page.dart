import 'package:flutter/material.dart';
import 'package:flutterkeepgoing/common/app_bar.dart';

class AccountInfoPage extends StatefulWidget {
  AccountInfoPage({Key key}) : super(key: key);

  _AccountInfoPageState createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: MyAppBar(
          centerTitle: "个人信息",
          actionName: "完成",
          onPressed: (){
            print('提交个人信息');
         }
        ),
    );
  }
}