import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weatherapp/constant/constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewContact extends StatefulWidget {
  WebviewContact({Key? key}) : super(key: key);
  @override
  WebviewContactState createState() => WebviewContactState();
}

class WebviewContactState extends State<WebviewContact> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
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
              initialUrl: Url3,
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
      ),
    );
    // return Scaffold(
    //     appBar: AppBar(
    //       title: Text("zz"),
    //     ),
    //     body: SingleChildScrollView(
    //       child: Text("data"),
    //       // child: WebView(
    //       //   initialUrl: 'https://flutter.dev',
    //       // ),
    //     ));
    // return WebView(
    //   initialUrl: 'https://flutter.dev',
    // );
  }
}
