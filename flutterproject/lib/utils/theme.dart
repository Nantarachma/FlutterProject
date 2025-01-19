import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.blue,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black54),
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
  ),
);