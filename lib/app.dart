import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/home_screen.dart';
import 'mini_projects/shopping_cart/providers/cart_provider.dart';

class FlutterMiniProjectsApp extends StatelessWidget {
  const FlutterMiniProjectsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
        title: 'Flutter Mini Projects',
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}