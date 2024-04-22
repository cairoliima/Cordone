import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TelaWoman extends StatefulWidget {
  TelaWoman({
    Key? key,
  }) : super(key: key);

  @override
  State<TelaWoman> createState() => _TelaWomanState();
}

class _TelaWomanState extends State<TelaWoman> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://cordonelingerie.lojavirtualnuvem.com.br/cordone-lingerie/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}