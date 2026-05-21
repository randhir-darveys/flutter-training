import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  int get itemCount => _cartItems.length;

  double get totalPrice {
    double total = 0;

    for (final product in _cartItems) {
      total += product.price;
    }

    return total;
  }

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}

// Explanation
// CartProvider shared cart state manage karta hai. Jab item add/remove hota hai, notifyListeners() UI ko update kar deta hai.