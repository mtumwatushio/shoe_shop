import 'package:flutter/material.dart';
import '../models/shoe_model.dart'; // Ensure ShoeModel is being imported

class CartModel extends ChangeNotifier {
  final List<ShoeModel> _cartItems = []; // Use ShoeModel instead of Shoe

  // Getter to retrieve the items in the cart
  List<ShoeModel> get cartItems => _cartItems;

  // Method to add an item to the cart
  void addToCart(ShoeModel shoe) {
    _cartItems.add(shoe);
    notifyListeners(); // Notify listeners of the change
  }

  // Method to remove an item from the cart
  void removeFromCart(ShoeModel shoe) {
    _cartItems.remove(shoe);
    notifyListeners(); // Notify listeners of the change
  }

  // Calculate the total price of the items in the cart
  double get totalPrice {
    return _cartItems.fold(0, (sum, shoe) => sum + shoe.price);
  }

  // Clear the entire cart
  void clearCart() {
    _cartItems.clear();
    notifyListeners(); // Notify listeners after clearing the cart
  }
}
