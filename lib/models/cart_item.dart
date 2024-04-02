import 'package:flutter/material.dart';

class CartItem {
  final String productName;
  final int quantity;
  final List<String> addons;

  CartItem({
    required this.productName,
    required this.quantity,
    required this.addons,
  });
}

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }
}
