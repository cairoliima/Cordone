import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TelaSite extends StatefulWidget {
  TelaSite({
    Key? key,
  }) : super(key: key);

  @override
  State<TelaSite> createState() => _TelaSiteState();
}

class _TelaSiteState extends State<TelaSite> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://cordonelingerie.lojavirtualnuvem.com.br/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}