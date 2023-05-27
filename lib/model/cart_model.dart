import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = [
    // [itemName, price, path, color]
    ["Chips", "4.00", "lib/images/chipis.png", Colors.green],
    ["Dennis", "999.50", "lib/images/dennisprime.png", Colors.brown],
    ["Nuggets", "12.80", "lib/images/nuggetss.png", Colors.yellow],
    ["Dieser andere", "920.00", "lib/images/derandere.png", Colors.blue],
  ];

  // list of cart items
  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(
      _shopItems[index],
    );
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
