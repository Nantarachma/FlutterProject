import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'utils/theme.dart';
import 'utils/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfumery App',
      theme: AppTheme.light,
      builder: (context, child) {
        SizeConfig.init(context); // Menggunakan method static
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
          child: child!,
        );
      },
      home: const HomePage(), // Menggunakan HomePage sebagai halaman utama
    );
  }
}