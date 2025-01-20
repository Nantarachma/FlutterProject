import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfumery App',
      theme: AppTheme.light, // Menerapkan tema
      home: const HomePage(),
    );
  }
}