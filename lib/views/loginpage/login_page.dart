
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flustars/flustars.dart' as FlutterStars;
// import 'package:flutterkeepgoing/common/app_bar.dart';
// import 'package:flutterkeepgoing/common/colors.dart';
// import 'package:flutterkeepgoing/common/key_config.dart';
// import 'package:flutterkeepgoing/common/styles.dart';
// import 'package:flutterkeepgoing/util/utils.dart';
// import 'package:keyboard_actions/keyboard_actions.dart';
// import 'package:flutterkeepgoing/common/text_field.dart';
 


// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login>with AutomaticKeepAliveClientMixin<Login>, SingleTickerProviderStateMixin  {
  
//     @override
//   bool get wantKeepAlive => true; 
  
//   //定义一个controller
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   final FocusNode _nodeText1 = FocusNode();
//   final FocusNode _nodeText2 = FocusNode();
//   KeyboardActionsConfig _config;
//   bool _isClick = false;

//   @override
//   void initState() {
//     super.initState();
//     //监听输入改变  
//     _nameController.addListener(_verify);
//     _passwordController.addListener(_verify);
//     _nameController.text = FlutterStars.SpUtil.getString(Keys.phone);
//     _config = Utils.getKeyboardActionsConfig([_nodeText1, _nodeText2]);
//   }

//   void _verify(){
//     String name = _nameController.text;
//     String password = _passwordController.text;
//     bool isClick = true;
//     if (name.isEmpty || name.length < 11) {
//       isClick = false;
//     }
//     if (password.isEmpty || password.length < 6) {
//       isClick = false;
//     }

//     /// 状态不一样在刷新，避免重复不必要的setState
//     if (isClick != _isClick){
//       setState(() {
//         _isClick = isClick;
//       });
//     }
//   }
  
//   void _login(){
  
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(
//         isBack: false,
//         actionName: '验证码登录',
//         onPressed: (){

//         },
//       ),
//       body: defaultTargetPlatform == TargetPlatform.iOS ? FormKeyboardActions(
//         child: _buildBody(),
//       ) : SingleChildScrollView(
//         child: _buildBody(),
//       ) 
//     );
//   }
  
//   _buildBody(){
//     return Padding(
//       padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             "密码登录",
//             style: TextStyles.textBoldDark26,
//           ),
//           Gaps.vGap16,
//           MyTextField(
//             focusNode: _nodeText1,
//             controller: _nameController,
//             maxLength: 11,
//             keyboardType: TextInputType.phone,
//             hintText: "请输入账号",
//           ),
//           Gaps.vGap10,
//           MyTextField(
//             focusNode: _nodeText2,
//             config: _config,
//             isInputPwd: true,
//             controller: _passwordController,
//             maxLength: 16,
//             hintText: "请输入密码",
//           ),
//           Gaps.vGap10,
//           Gaps.vGap15,
         
//           Container(
//             height: 40.0,
//             alignment: Alignment.centerRight,
//             child: GestureDetector(
//               child: Text(
//                 '忘记密码',
//                 style: TextStyles.textGray12,
//               ),
//               onTap: (){

//               },
//             ),
//           ),
//           Gaps.vGap16,
//           Container(
//               alignment: Alignment.center,
//               child: GestureDetector(
//                 child: Text(
//                   '还没账号？快去注册',
//                   style: TextStyle(
//                       color: Colours.text_blue
//                   ),
//                 ),
//                 onTap: (){

//                 },
//               )
//           )
//         ],
//       ),
//     );
//   }
// }
