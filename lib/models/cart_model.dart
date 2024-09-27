import 'package:flutter/foundation.dart';
import '../models/shoe_model.dart';

class CartModel extends ChangeNotifier {
  final List<ShoeModel> _items = [];

  List<ShoeModel> get items => _items;

  void addItem(ShoeModel shoe) {
    _items.add(shoe);
    notifyListeners();
  }

  double get totalPrice => _items.fold(0, (total, current) => total + current.price);
}
