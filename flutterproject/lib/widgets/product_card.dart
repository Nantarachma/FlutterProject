import 'package:flutter/material.dart';
import '../screens/detail_page.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String price;
  final double rating;
  final double imageHeight;
  final double imageWidth;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.price,
    required this.rating,
    this.imageHeight = 150,
    this.imageWidth = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              imageUrl: imageUrl,
              productName: productName,
              price: price,
              rating: rating,
            ),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                imageUrl,
                height: imageHeight,
                width: imageWidth,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    textAlign: TextAlign.center, // Alignment
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20, // Font size
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    price,
                    textAlign: TextAlign.center, // Alignment
                    style: const TextStyle(
                      fontSize: 18, // Font size
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Alignment
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 16),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          fontSize: 16, // Font size
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}