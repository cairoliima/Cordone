import 'package:cordone/view/tela_contato.dart';
import 'package:cordone/view/tela_man.dart';
import 'package:cordone/view/tela_paleta.dart';
import 'package:cordone/view/tela_site.dart';
import 'package:cordone/view/tela_tamanho.dart';
import 'package:cordone/view/tela_woman.dart';
import 'package:flutter/material.dart';


class TelaInicial extends StatefulWidget {
  TelaInicial({
    Key? key,
  }) : super(key: key);

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  get keyboardType => null;
  get raisedButtonStyle => null;


  @override
  initState() {
    super.initState();
  }

  int _currentIndex = 0;

  final List<Widget> _tabs = [
    TelaSite(),
    TelaWoman(),
    TelaMan(),
    TelaTamanho(),
    TelaPaleta(),
    TelaContato(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('TabBarView Example'),
      // ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
          selectedItemColor: Colors.black, // Define a cor dos ícones e texto selecionados
          unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black,),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.woman, color: Colors.black,),
            label: 'Lingerie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.man, color: Colors.black,),
            label: 'Cuecas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_size, color: Colors.black,),
            label: 'Tamanho',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box, color: Colors.black,),
            label: 'Paleta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black,),
            label: 'Contato',
          ),
        ],
      ),
    );
  }
}


