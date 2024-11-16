// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class redes_social_link extends StatefulWidget {
  const redes_social_link({super.key});

  @override
  State<redes_social_link> createState() => _redes_social_linkState();
}

class _redes_social_linkState extends State<redes_social_link> {
  final Map<String, bool> iconosActivo = {
    'email': false,
    'instagram': false,
    'github': false,
  };

  final Color colorInactivo = Colors.grey;
  final Color colorActivo = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      children: [
        ActionChip(
            avatar: Icon(
                iconosActivo["email"]! ? Icons.mail : Icons.mail_outline,
                color: iconosActivo["email"]! ? colorActivo : colorInactivo),
            label: const Text('Outlook'),
            onPressed: () {
              setState(() {
                iconosActivo["email"] = !iconosActivo["email"]!;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("www.outlook.com"),
                  duration: Duration(seconds: 1),
                ),
              );
            }),
        ActionChip(
            avatar: Image.network(
              'https://github.githubassets.com/assets/GitHub-Mark-ea2971cee799.png',
              width: 30,
              height: 30,
            ),
            label: const Text('Github'),
            onPressed: () {
              setState(() {
                iconosActivo["github"] = !iconosActivo["github"]!;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("www.github.com"),
                  duration: Duration(seconds: 1),
                ),
              );
            }),
        ActionChip(
            avatar: Icon(
                iconosActivo["instagram"]!
                    ? Icons.camera_alt
                    : Icons.camera_alt_outlined,
                color:
                    iconosActivo["instagram"]! ? colorActivo : colorInactivo),
            label: const Text('Instagram'),
            onPressed: () {
              setState(() {
                iconosActivo["instagram"] = !iconosActivo["instagram"]!;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("www.Instagram.com"),
                  duration: Duration(seconds: 1),
                ),
              );
            }),
      ],
    );
  }
}
