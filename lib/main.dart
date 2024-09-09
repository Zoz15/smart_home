import 'package:flutter/material.dart';
import 'package:smart_home/screens/Home_Screen.dart';
import 'package:smart_home/screens/thermostat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Thermostat(),
    );
  }
}
