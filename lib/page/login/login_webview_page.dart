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
                print("code ${code}");
                Navigator.of(context).pop(code);
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
