import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TelaTamanho extends StatefulWidget {
  TelaTamanho({
    Key? key,
  }) : super(key: key);

  @override
  State<TelaTamanho> createState() => _TelaTamanhoState();
}

class _TelaTamanhoState extends State<TelaTamanho> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://cordonelingerie.lojavirtualnuvem.com.br/guia-de-medidas/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}