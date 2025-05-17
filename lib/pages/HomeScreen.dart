import 'package:calculator/pages/IcecreamView.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(color: Colors.white, child: Icecreamview()),
      ),
    );
  }
}
