import 'package:flutter/material.dart';
import '../widgets/responsive_layout.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: ResponsiveLayout(
        wide: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue[100],
                child: const Center(child: Text('Left Side')),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue[200],
                child: const Center(child: Text('Right Side')),
              ),
            ),
          ],
        ),
        narrow: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue[100],
                child: const Center(child: Text('Top Side')),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue[200],
                child: const Center(child: Text('Bottom Side')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}