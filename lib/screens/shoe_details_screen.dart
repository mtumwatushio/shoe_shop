import 'package:flutter/material.dart';
import '../models/shoe_model.dart';

class ShoeDetailsScreen extends StatelessWidget {
  final ShoeModel shoe;

  ShoeDetailsScreen({required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shoe.name),
      ),
      body: Column(
        children: [
          Image.asset(shoe.image),
          SizedBox(height: 20),
          Text(
            shoe.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('\$${shoe.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 18, color: Colors.grey)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add functionality for adding to cart
            },
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
