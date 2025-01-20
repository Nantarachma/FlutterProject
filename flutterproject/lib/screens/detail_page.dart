import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String price;
  final double rating;

  const DetailPage({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.price,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(productName)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center( // Center widget to center the image
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
              Text(productName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(price, style: const TextStyle(fontSize: 20, color: Colors.green)),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 24),
                  Text(rating.toString(), style: const TextStyle(fontSize: 20)),
                ],
              ),
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