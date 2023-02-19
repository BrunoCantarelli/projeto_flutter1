import 'package:flutter/material.dart';
import 'package:projeto_flutter1/screens/formScreen.dart';
import 'package:projeto_flutter1/screens/initialScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        canvasColor: Colors.white,
      ),
      home: const FormScreen(),
    );
  }
}
