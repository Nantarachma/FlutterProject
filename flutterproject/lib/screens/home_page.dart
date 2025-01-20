import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../models/item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Daftar item
    final List<Item> items = [
      Item(
        imageUrl: 'assets/mykonos_downtoearth.png',
        productName: 'Mykonos Down To Earth',
        price: '\$25',
        rating: 4.5,
      ),
      Item(
        imageUrl: 'assets/mykonos_enchanted.png',
        productName: 'Mykonos Enchanted',
        price: '\$20',
        rating: 4.0,
      ),
      Item(
        imageUrl: 'assets/scandalicius.png',
        productName: 'Scandalicius',
        price: '\$30',
        rating: 4.8,
      ),
      Item(
        imageUrl: 'assets/wishoftomorrow.png',
        productName: 'Wish of Tomorrow',
        price: '\$35',
        rating: 4.2,
      ),
      Item(
        imageUrl: 'assets/wonka.png',
        productName: 'Wonka',
        price: '\$40',
        rating: 4.7,
      ),
      // Tambahkan item baru di sini
    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Best Perfumery',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'All your perfume needs',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.wifi),
          SizedBox(width: 10),
          Icon(Icons.battery_full),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          // Tab bar
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Popular'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('New Arrival'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Best Seller'),
                ),
              ],
            ),
          ),

          // Grid view
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ProductCard(
                  imageUrl: item.imageUrl,
                  productName: item.productName,
                  price: item.price,
                  rating: item.rating,
                  imageHeight: 500, // Ubah ukuran gambar di sini
                  imageWidth: 500, // Ubah ukuran gambar di sini
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}