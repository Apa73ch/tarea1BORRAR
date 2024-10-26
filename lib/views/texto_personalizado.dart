import 'package:flutter/material.dart';

class TextoPersonalizado extends StatelessWidget {
  const TextoPersonalizado({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Título Principal',
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              letterSpacing: 1.5),
        ),
        Text('Subtítulo en cursiva',
            style: TextStyle(
              fontSize: 22,
              fontStyle: FontStyle.italic,
              color: Colors.purple[400],
              height: 1.5,
            )),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Texto subrayado',
          style: TextStyle(
              fontSize: 18,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.red,
              decorationThickness: 3),
        ),
        const Text(
          'Texto con sombra',
          style: TextStyle(fontSize: 28, color: Colors.green, shadows: [
            Shadow(blurRadius: 3.0, color: Colors.grey, offset: Offset(2, 2))
          ]),
        )
      ],
    );
  }
}
