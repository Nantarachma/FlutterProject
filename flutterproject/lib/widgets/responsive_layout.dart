import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget wide;
  final Widget narrow;
  final double breakpoint;

  const ResponsiveLayout({
    super.key,
    required this.wide,
    required this.narrow,
    this.breakpoint = 700,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > breakpoint) {
          return wide;
        } else {
          return narrow;
        }
      },
    );
  }
}