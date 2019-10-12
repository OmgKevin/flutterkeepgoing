import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterkeepgoing/common/app_bar.dart';
import 'package:flutterkeepgoing/common/colors.dart';
import 'package:flutterkeepgoing/common/styles.dart';
import 'package:flutterkeepgoing/widgets/mybutton_widget.dart';
import 'package:flutterkeepgoing/widgets/text_field_item.dart';
import 'package:flutterkeepgoing/widgets/text_input_widget.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class FeedBackPage extends StatefulWidget {
  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  //定义一个controller
  TextEditingController _feedbackController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  // KeyboardActionsConfig _config;
  bool _isClick = false;

  @override
  void initState() {
    super.initState();
    //监听输入改变
    _feedbackController.addListener(_verify);
    _phoneNumberController.addListener(_verify);
    // _config = Utils.getKeyboardActionsConfig([_nodeText1, _nodeText2]);
  }

  void _verify() {
    String feedback = _feedbackController.text;
    String phonenumber = _phoneNumberController.text;
    bool isClick = true;
    if (feedback.isEmpty || feedback.length < 1) {
      isClick = false;
    }
    if (phonenumber.isEmpty || phonenumber.length < 1) {
      isClick = false;
    }

    /// 状态不一样在刷新，避免重复不必要的setState
    if (isClick != _isClick) {
      setState(() {
        _isClick = isClick;
      });
    }
  }

  void _login() {
    print('提交反馈');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colours.bg_color,
        appBar: MyAppBar(
          centerTitle: "意见反馈",
        ),
        body: defaultTargetPlatform == TargetPlatform.iOS
            ? FormKeyboardActions(
                child: _buildBody(),
              )
            : SingleChildScrollView(
                child: _buildBody(),
              ));
  }

  _buildBody() {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // 触摸收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: InputTextPage(
                  focusNode: _nodeText1,
                  controller: _feedbackController,
                  maxLength: 11,
                ),
              ),
              TextFieldItem(
                title: "联系方式:",
                hintText: "手机号/微信号",
                focusNode: _nodeText2,
                controller: _phoneNumberController,
              ),
              Gaps.vGap200,
              Container(
                margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: MyButton(
                  onPressed: _isClick ? _login : null,
                  // onPressed: (){},
                  text: "提交反馈",
                ),
              ),
            ],
          ),
        ));
    }
}
