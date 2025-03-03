import 'package:flutter/material.dart';
import 'package:neubrutal_kit_example/showcase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NeuBrutal App',
      home: const Showcase()
    );
  }
}
