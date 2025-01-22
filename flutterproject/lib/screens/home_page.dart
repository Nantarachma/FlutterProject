import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../models/item.dart';
import 'about_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  ];

  final Map<String, bool> favoriteStatus = {};

  void toggleFavorite(String productName, bool isFavorite) {
    setState(() {
      favoriteStatus[productName] = isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildFilterButton('Popular'),
                const SizedBox(width: 8),
                _buildFilterButton('New Arrival'),
                const SizedBox(width: 8),
                _buildFilterButton('Best Seller'),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.68,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final isFavorite = favoriteStatus[item.productName] ?? false;
                  return ProductCard(
                    imageUrl: item.imageUrl,
                    productName: item.productName,
                    price: item.price,
                    rating: item.rating,
                    isFavorite: isFavorite,
                    onFavoriteToggle: (isFavorite) {
                      toggleFavorite(item.productName, isFavorite);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        minimumSize: const Size(80, 36),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}