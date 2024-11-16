import 'package:clase_widgets/views/icons.dart';
import 'package:flutter/material.dart';

class TarjetaPerfil extends StatelessWidget {
  const TarjetaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tarjeta Perfil'),
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 31, 31, 32),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: const Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3))
                    ]),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('ig.jpg'),
                    ),
                    Text(
                      "Roger Gonzalez",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "Intento de Desarrolador",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 10),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Habilidades",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: (Colors.white)),
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: const [
                        Chip(
                          label: Text("Flutter"),
                        ),
                        Chip(
                          label: Text("Dart"),
                        ),
                        Chip(
                          label: Text("C#"),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Iconos(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
