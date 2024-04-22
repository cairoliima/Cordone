
import 'package:cordone/view/tela_inicial.dart';
import 'package:flutter/material.dart';

class TelaCarregamento extends StatefulWidget {
  TelaCarregamento({
    Key? key,
  }) : super(key: key);

  @override
  State<TelaCarregamento> createState() => _TelaCarregamentoState();
}

class _TelaCarregamentoState extends State<TelaCarregamento> {
  get keyboardType => null;
  get raisedButtonStyle => null;


  @override
  initState() {
    super.initState();
    _proximaPagina();
  }


  _proximaPagina() async {

    await Future.delayed(const Duration(seconds: 2));
    // Navegando para a próxima página após o atraso
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TelaInicial()),
    );
  }





  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery
            .of(context)
            .size
            .width;
    double screenHeight =
        MediaQuery
            .of(context)
            .size
            .height;

    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Container(
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: screenWidth * 0.7,
                height: screenHeight * 0.2,
                child: Image.asset(
                  'assets/img/cordone2.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
