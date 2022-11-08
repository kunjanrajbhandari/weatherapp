import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weatherapp/constant/constant.dart';
import 'package:weatherapp/view/widget/web_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  WebViewExample({Key? key}) : super(key: key);
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  static Future<String> get _url async {
    await Future.delayed(Duration(seconds: 1));
    return Url1;
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 29.0),
          child: WebView(
            initialUrl: Url1,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              isLoading = false;
              setState(() {});
            },
          ),
        ),
        Visibility(
            visible: isLoading,
            child: Center(child: CircularProgressIndicator())),
      ],
    ));
  }
}
