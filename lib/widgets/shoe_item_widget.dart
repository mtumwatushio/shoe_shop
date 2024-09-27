import 'package:flutter/material.dart';
import '../models/shoe_model.dart';

class ShoeItemWidget extends StatelessWidget {
  final ShoeModel shoe;
  final Color color;
  final Color nameColor; // New: Color for shoe name
  final Color priceColor; // New: Color for shoe price

  const ShoeItemWidget({
    super.key,
    required this.shoe,
    required this.color,
    this.nameColor = Colors.black, // Default color for shoe name
    this.priceColor = Colors.grey, // Default color for shoe price
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(shoe.image, height: 100, fit: BoxFit.contain),
          const SizedBox(height: 8),
          Text(
            shoe.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: nameColor, // Use custom color for shoe name
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '\$${shoe.price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 16,
              color: priceColor, // Use custom color for shoe price
            ),
          ),
        ],
      ),
    );
  }
}
