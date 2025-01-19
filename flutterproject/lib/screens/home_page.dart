import 'package:flutter/material.dart';
import '../widgets/responsive_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ResponsiveLayout(
        wide: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text('Go to Second Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/input');
                },
                child: const Text('Go to Input Page'),
              ),
            ],
          ),
        ),
        narrow: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text('Go to Second Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/input');
                },
                child: const Text('Go to Input Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}