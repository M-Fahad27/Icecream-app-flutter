import 'package:calculator/pages/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ice Cream ",
      theme: ThemeData(primaryColor: Colors.white),
      home: Homescreen(),
    );
  }
}
