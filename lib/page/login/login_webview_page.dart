/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-23 19:40:45
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-24 09:48:48
 * @FilePath: /flutter_clone_github/lib/page/login/login_webview_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginWebviewPage extends StatefulWidget {
  final String? title;
  final String? url;

  const LoginWebviewPage({Key? key, this.title, this.url}) : super(key: key);

  @override
  State<LoginWebviewPage> createState() => _LoginWebviewPageState();
}

class _LoginWebviewPageState extends State<LoginWebviewPage> {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
    super.initState();
  }

  Widget _renderAppBarTitle() {
    if (widget.url!.isEmpty) {
      return Text(widget.title!);
    }
    return Row(
      children: [
        Expanded(
            child: Container(
                child: Text(widget.title!,
                    maxLines: 1, overflow: TextOverflow.ellipsis)))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _renderAppBarTitle(),
      ),
      body: Stack(
        children: [
          TextField(focusNode: focusNode),
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
            navigationDelegate: (navigation) {
              if (navigation.url.startsWith('gsygithubapp://authed')) {
                var code = Uri.parse(navigation.url).queryParameters['code'];
                print("code $code");
                Navigator.pop(context, code);
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
            onPageFinished: (_) {
              print('已经完成===');
            },
          )
        ],
      ),
    );
  }
}
