import 'package:flutter/material.dart';

class Iconos extends StatefulWidget {
  const Iconos({super.key});

  @override
  State<Iconos> createState() => _IconosState();
}

class _IconosState extends State<Iconos> {
  final Map<String, bool> iconsAtivo = {
    'facebook': false,
    'instagram': false,
    'tiktok': false,
  };
  final Color colorInnactivo = Colors.grey;
  final Color colorActivo = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //facebook
        IconButton(
          icon: Icon(
            Icons.facebook,
            color: iconsAtivo['facebook']! ? colorActivo : colorInnactivo,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              iconsAtivo['facebook'] = !iconsAtivo['facebook']!;
            });
          },
        ),
        //Tiktok
        IconButton(
          icon: Icon(
            Icons.tiktok,
            color: iconsAtivo['tiktok']! ? colorActivo : colorInnactivo,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              iconsAtivo['tiktok'] = !iconsAtivo['tiktok']!;
            });
          },
        ),
        //istagram
        IconButton(
          icon: Icon(
            Icons.photo_camera,
            color: iconsAtivo['instagram']! ? colorActivo : colorInnactivo,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              iconsAtivo['instagram'] = !iconsAtivo['instagram']!;
            });
          },
        ),
      ],
    );
  }
}
