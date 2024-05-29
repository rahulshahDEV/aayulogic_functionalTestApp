import 'package:apitest/allmethod.dart';
import 'package:apitest/flutterSlider.dart';
import 'package:apitest/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "API TESTING",
      theme: ThemeData(useMaterial3: true),
      home: HomeScreen(),
    );
  }
}
