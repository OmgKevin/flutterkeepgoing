
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutterkeepgoing/common/app_bar.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebViewPage extends StatefulWidget {
//   const WebViewPage({
//     Key key,
//     @required this.title,
//     @required this.url,
//   }) : super(key: key);

//   final String title;
//   final String url;

//   @override
//   _WebViewPageState createState() => _WebViewPageState();
// }

// class _WebViewPageState extends State<WebViewPage> {
//   final Completer<WebViewController> _controller = Completer<WebViewController>();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<WebViewController>(
//         future: _controller.future,
//         builder: (context, snapshot) {
//           return Scaffold(
//               body: WillPopScope(
//             onWillPop: () async {
//               if (snapshot.hasData) {
//                 bool canGoBack = await snapshot.data.canGoBack();
//                 if (canGoBack) {
//                   // 网页可以返回时，优先返回上一页
//                   snapshot.data.goBack();
//                   return Future.value(false);
//                 }
//                 return Future.value(true);
//               }
//               return Future.value(true);
//             },
//             child: SafeArea(
//               child: Scaffold(
//                 appBar: MyAppBar(
//                   centerTitle: widget.title,
//                 ),
//                 body: WebView(
//                   initialUrl: widget.url,
//                   javascriptMode: JavascriptMode.unrestricted,
//                   onWebViewCreated: (WebViewController webViewController) {
//                     _controller.complete(webViewController);
//                   },
                 
//                  // 方法二
//                   navigationDelegate: (NavigationRequest request) {
//                     if (request.url.startsWith('js://webview')) {
//                       print("即将打开 ${request.url}");
//                       return NavigationDecision.prevent;
//                     }
//                     return NavigationDecision.navigate;
//                   },
                  
//                   // 方法一
//                   javascriptChannels: <JavascriptChannel>[
//                     JavascriptChannel(
//                         name: "toAppPage",
//                         onMessageReceived: (JavascriptMessage message) {
//                           print("参数： ${message.message}");
//                         }),
//                   ].toSet(),

//                         // onPageFinished: (url) {
//           //   _controller.evaluateJavascript("document.title").then((result) {
//           //     setState(() {});
//           //   });
//           // },

//                 ),
//               ),
//             ),
//           ));
//         });
//   }
// }



// 优化简介版

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterkeepgoing/common/app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    Key key,
    @required this.title,
    @required this.url,
  }) : super(key: key);

  final String title;
  final String url;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  final Completer<WebViewController> _controller = Completer<WebViewController>();

  JavascriptChannel _alertJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toast',
        onMessageReceived: (JavascriptMessage message) {
          // showToast(message.message); 执行调用flutter侧的逻辑代码
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: widget.title,
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },

          javascriptChannels: <JavascriptChannel>[
                _alertJavascriptChannel(context),
            ].toSet(),

        ),
      ),
    );
  }
}
