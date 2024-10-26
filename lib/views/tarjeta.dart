import 'package:clase_widgets/views/iconos_sociales.dart';
import 'package:clase_widgets/views/texto_personalizado.dart';
import 'package:flutter/material.dart';

class TarjetaPerfil extends StatelessWidget {
  const TarjetaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tarjeta Perfil')),
        body: Column(
          children: [
            Center(
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3))
                    ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/usuario.png'),
                    ),
                    const Text(
                      'Luis Rafael Rodríguez',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Desarrollador Flutter',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SizedBox(height: 20),
                    const IconosSociales()
                  ],
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(16.0), child: TextoPersonalizado())
          ],
        ));
  }
}
