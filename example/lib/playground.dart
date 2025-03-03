import 'package:flutter/material.dart';
import 'package:neubrutal_kit/neubrutal_kit.dart';


class Playground extends StatefulWidget {
  const Playground({super.key});

  @override
  State<Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NeuButton(child: Text("Click me"), onPressed: (){}),
      ),
    );
  }
}
