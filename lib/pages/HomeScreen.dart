import 'package:calculator/pages/calculator_view.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 86, 143),
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 12, 86, 143),
          child: CalculatorView(),
        ),
      ),
    );
  }
}
