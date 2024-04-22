import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TelaMan extends StatefulWidget {
  TelaMan({
    Key? key,
  }) : super(key: key);


  @override
  State<TelaMan> createState() => _TelaManState();
}

class _TelaManState extends State<TelaMan> {



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://cordonelingerie.lojavirtualnuvem.com.br/cordonemen/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}