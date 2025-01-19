import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/second_page.dart';
import 'screens/input_page.dart';
import 'utils/theme.dart';  // Import theme

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,  // Gunakan theme dari utils/theme.dart
      home: const HomePage(),
      routes: {
        '/second': (context) => const SecondPage(),
        '/input': (context) => const InputPage(),
      },
    );
  }
}