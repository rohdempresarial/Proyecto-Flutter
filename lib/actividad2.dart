import 'package:flutter/material.dart';

class Actividad2 extends StatefulWidget {
  const Actividad2({Key? key}) : super(key: key);

  @override
  State<Actividad2> createState() => _Actividad2State();
}

class _Actividad2State extends State<Actividad2> {
  String mensaje = 'Realice un gesto';
  Color colorFondo = Colors.blueAccent;

  void actualizarMensaje(String nuevoMensaje, Color color) {
    setState(() {
      mensaje = nuevoMensaje;
      colorFondo = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividad 2 - Gestos'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            actualizarMensaje('👆 Toque simple detectado', Colors.green);
          },
          onDoubleTap: () {
            actualizarMensaje('✌ Doble toque detectado', Colors.orange);
          },
          onPanUpdate: (details) {
            if (details.delta.dx > 0) {
              actualizarMensaje('➡ Deslizaste a la DERECHA', Colors.purple);
            } else if (details.delta.dx < 0) {
              actualizarMensaje('⬅ Deslizaste a la IZQUIERDA', Colors.red);
            } else if (details.delta.dy > 0) {
              actualizarMensaje('⬇ Deslizaste ABAJO', Colors.teal);
            } else if (details.delta.dy < 0) {
              actualizarMensaje('⬆ Deslizaste ARRIBA', Colors.brown);
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: colorFondo,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(4, 4),
                )
              ],
            ),
            child: Center(
              child: Text(
                mensaje,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
