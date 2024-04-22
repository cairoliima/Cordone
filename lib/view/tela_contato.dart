import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TelaContato extends StatefulWidget {
  TelaContato({
    Key? key,
  }) : super(key: key);

  @override
  State<TelaContato> createState() => _TelaContatoState();
}

class _TelaContatoState extends State<TelaContato> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://cordonelingerie.lojavirtualnuvem.com.br/contato/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}