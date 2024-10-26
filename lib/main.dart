import 'package:clase_widgets/views/tarjeta.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Primera App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TarjetaPerfil(),
    );
  }
}

class Texto extends StatelessWidget {
  const Texto({super.key});

  Widget build(BuildContext) {
    return Text("Hola mundo");
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mi Primera App')),
      body: const Center(
        child: Text(
          'Hola mundo',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
