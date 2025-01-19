import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String price;

  const SecondPage({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(imageUrl, fit: BoxFit.cover),
              const SizedBox(height: 16),
              Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(description, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              Text(price, style: const TextStyle(fontSize: 20, color: Colors.green)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Implement buy action
                },
                child: const Text('Buy Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}