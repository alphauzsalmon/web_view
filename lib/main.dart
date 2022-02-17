import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebView App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WebViewPage(),
    );
  }
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController controller;

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://kun.uz',
          onWebViewCreated: (WebViewController _webController) {
            controller = _webController;
          },
          onPageFinished: (a) async {
            // For fetch cookies
            //final String cookies = await controller.runJavascriptReturningResult('document.cookie');
          },
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}



