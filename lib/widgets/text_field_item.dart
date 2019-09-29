import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterkeepgoing/common/styles.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class TextFieldItem extends StatelessWidget {
  const TextFieldItem(
      {Key key,
      this.controller,
      @required this.title,
      this.keyboardType: TextInputType.text,
      this.hintText: "",
      this.focusNode,
      this.config})
      : super(key: key);

  final TextEditingController controller;
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final KeyboardActionsConfig config;

  @override
  Widget build(BuildContext context) {
    if (config != null && defaultTargetPlatform == TargetPlatform.iOS) {
      // 因Android平台输入法兼容问题，所以只配置IOS平台
      FormKeyboardActions.setKeyboardActions(context, config);
    }
    return Container(
      // height: 50.0,
      margin: const EdgeInsets.only(left: 20.0, right: 8),
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              '联系方式',
              style: TextStyles.textBoldDark16,
            ),
          ),
          Expanded(
            flex: 1,
            child: Theme(
              data: new ThemeData(
                  primaryColor: Color(0xFFF6F6F6),
                  hintColor: Color(0xFFF6F6F6)),
              child: TextField(
                maxLength: 11,
                focusNode: focusNode,
                keyboardType: keyboardType,
                inputFormatters: _getInputFormatters(),
                controller: controller,
                style: TextStyles.textDark14,
                decoration: new InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: hintText,
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  hintStyle: TextStyle(color: Color(0xFF999999)),
                ),
              ),
            ),
          ),
          Gaps.hGap16
        ],
      ),
    );
  }

  _getInputFormatters() {
    // if (keyboardType == TextInputType.numberWithOptions(decimal: true)){
    //   return [UsNumberTextInputFormatter()];
    // }
    // if (keyboardType == TextInputType.number || keyboardType == TextInputType.phone){
    //   return [WhitelistingTextInputFormatter.digitsOnly];
    // }
    // return null;
  }
}
