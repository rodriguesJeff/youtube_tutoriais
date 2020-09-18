import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter WebView Tutorial',
        home: Scaffold(
            body: Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: WebView(
                    initialUrl: 'https://clickagreste.baptistsoftware.com.br/',
                    javascriptMode: JavascriptMode.unrestricted,
                    navigationDelegate: (NavigationRequest request) {
                      if (request.url.startsWith('geo')) {
                        openMap(request.url);
                      }
                    }))));
  }

  static Future<void> openMap(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Não pode abrir a url');
    }
  }
}
