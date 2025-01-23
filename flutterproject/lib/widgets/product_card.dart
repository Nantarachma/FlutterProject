import 'package:flutter/material.dart';
import '../screens/detail_page.dart';

class ProductCard extends StatefulWidget {
  final String imageUrl;
  final String productName;
  final String price;
  final double rating;
  final bool isFavorite;
  final Function(bool) onFavoriteToggle;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.price,
    required this.rating,
    this.isFavorite = false,
    required this.onFavoriteToggle,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    widget.onFavoriteToggle(isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final baseFontSize = screenSize.width * 0.03;
    final constrainedFontSize = baseFontSize.clamp(11.0, 16.0);

    final textStyles = {
      'productName': TextStyle(
        fontSize: constrainedFontSize,
        fontWeight: FontWeight.bold,
      ),
      'price': TextStyle(
        fontSize: constrainedFontSize * 0.9,
        color: Colors.green,
        fontWeight: FontWeight.w500,
      ),
      'rating': TextStyle(
        fontSize: constrainedFontSize * 0.8,
        fontWeight: FontWeight.w500,
      ),
    };

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              imageUrl: widget.imageUrl,
              productName: widget.productName,
              price: widget.price,
              rating: widget.rating,
              isFavorite: isFavorite,
              onFavoriteToggle: (isFavorite) {
                toggleFavorite();
              },
            ),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: SizedBox(
                          width: screenSize.width * 0.06,
                          height: screenSize.width * 0.06,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: screenSize.width * 0.06,
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: screenSize.width * 0.01,
                    right: screenSize.width * 0.01,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        constraints: BoxConstraints(
                          minWidth: screenSize.width * 0.08,
                          minHeight: screenSize.width * 0.08,
                        ),
                        padding: EdgeInsets.zero,
                        iconSize: screenSize.width * 0.045,
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: toggleFavorite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenSize.width * 0.02).clamp(
                const EdgeInsets.all(4.0),
                const EdgeInsets.all(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.productName,
                    style: textStyles['productName'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: screenSize.width * 0.01),
                  Text(
                    widget.price,
                    style: textStyles['price'],
                  ),
                  SizedBox(height: screenSize.width * 0.01),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: constrainedFontSize * 1.2,
                      ),
                      SizedBox(width: screenSize.width * 0.01),
                      Text(
                        widget.rating.toString(),
                        style: textStyles['rating'],
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