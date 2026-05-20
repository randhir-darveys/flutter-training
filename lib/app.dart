import 'package:flutter/material.dart';
import 'home/home_screen.dart';

class FlutterMiniProjectsApp extends StatelessWidget {
  const FlutterMiniProjectsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Mini Projects',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}