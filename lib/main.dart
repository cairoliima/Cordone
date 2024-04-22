import 'package:camera/camera.dart';
import 'package:cordone/view/tela_carregamento.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';

List<CameraDescription> cameras = [];


void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  // cameras = await availableCameras();


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(const Aplicativo());
  });
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class Aplicativo extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  const Aplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      // navigatorKey: navigatorKey,
      // theme: ThemeData(
      //   inputDecorationTheme: InputDecorationTheme(
      //     focusedBorder: OutlineInputBorder(
      //
      //       borderRadius: BorderRadius.circular(15),
      //     ),
      //   ),
      // ),
      home: TelaCarregamento(),
    );
  }
}