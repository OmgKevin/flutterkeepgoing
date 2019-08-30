import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';


class InputTextPage extends StatefulWidget {

 const InputTextPage({
    Key key,
    @required this.controller,
    this.maxLength: 16,
    this.autoFocus: false,
    this.keyboardType: TextInputType.text,
    this.hintText: "",
    this.focusNode,
    this.isInputPwd: false,
    this.getVCode,
    this.config
  }): super(key: key);

  final TextEditingController controller;
  final int maxLength;
  final bool autoFocus;
  final TextInputType keyboardType;
  final String hintText;
  final FocusNode focusNode;
  final bool isInputPwd;
  final Future<bool> Function() getVCode;
  final KeyboardActionsConfig config;

  @override
  _InputTextPageState createState() => _InputTextPageState();
}

class _InputTextPageState extends State<InputTextPage> {

  int textLength = 0;

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Theme(
        data: new ThemeData(
            primaryColor: Color(0xFFF6F6F6), hintColor: Color(0xFFF6F6F6)),
        child: TextField(
            maxLength: 500,
            maxLines: 8,
            autofocus: true,
            controller: widget.controller,
            decoration: new InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: '告诉我们您遇到的问题，我们会在第一时间处理',
                contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 22),
                hintStyle: TextStyle(color: Color(0xFF999999)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
            onChanged: (text) {
              setState(() {
                textLength = text.length;
              });
            }),
      ),
      Positioned(
        bottom: 28,
        right: 12,
        child: Text('${textLength}/500',
            style: TextStyle(
              color: Color(0xFF999999),
            )),
      )
    ]);

    
  }
}
