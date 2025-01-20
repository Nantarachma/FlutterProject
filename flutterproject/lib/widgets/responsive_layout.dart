import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget wide;
  final Widget narrow;

  const ResponsiveLayout({
    Key? key,
    required this.wide,
    required this.narrow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 700) { // Mengubah breakpoint
          return wide;
        } else {
          return narrow;
        }
      },
    );
  }
}