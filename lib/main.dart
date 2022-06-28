import 'package:flutter/material.dart';
import 'package:teste_flutter/screens/home/home_screen.dart';
import 'package:teste_flutter/util/const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: const_debugMode,
      title: const_appName,
      theme: const_theme,
      home: HomeScreen(),
    );
  }
}