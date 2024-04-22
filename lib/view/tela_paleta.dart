import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class TelaPaleta extends StatefulWidget {
  TelaPaleta({
    Key? key,
  }) : super(key: key);

  @override
  State<TelaPaleta> createState() => _TelaPaletaState();
}

class _TelaPaletaState extends State<TelaPaleta> {
  late CameraController _controller;
  late CameraDescription _camera;
  bool _isReady = false;
  Color _selectedColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initCamera() async {
    try {
      final cameras = await availableCameras();

      setState(() {
        _camera = cameras.firstWhere(
              (camera) => camera.lensDirection == CameraLensDirection.front,
          orElse: () => cameras.first,
        );
        _controller = CameraController(
          _camera,
          ResolutionPreset.medium,
          imageFormatGroup: ImageFormatGroup.jpeg,
        );
        _controller.initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {
            _isReady = true;
          });
        });
      });
    } catch (e) {
      print('Erro ao inicializar a câmera: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) {
      return Container();
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Camera & Color Picker'),
      // ),
      body: Stack(
        children: [
          Positioned.fill(
            child: CameraPreview(_controller),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.black.withOpacity(0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Text(
                  //   'Selected Color:',
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  SizedBox(height: 8),
                  Container(
                    width: 50,
                    height: 50,
                    color: _selectedColor,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _showColorPicker(context);
                    },
                    child: Text('Cores'),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black.withOpacity(0.2)),
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Paleta de Cores:',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(20, (index) {
                        double fraction = index / 20;
                        Color color = HSLColor.fromColor(_selectedColor)
                            .withLightness(0.2 + fraction * 0.6)
                            .toColor();
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedColor = color;
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 4.0),
                            color: color,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecione a cor..'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _selectedColor,
              onColorChanged: (Color color) {
                setState(() {
                  _selectedColor = color;
                });
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
