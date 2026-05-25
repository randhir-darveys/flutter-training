import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('todoBox');
  runApp(const FlutterMiniProjectsApp());
}


// WidgetsFlutterBinding.ensureInitialized()
// → async initialization ke liye required
//
// Hive.initFlutter()
// → Hive setup karta hai
//
// Hive.openBox('todoBox')
// → local storage box open/create karta hai