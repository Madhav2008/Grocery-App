import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = const [
    [
      "Avocado",
      "90",
      "../assets/images/avocado.png",
      Colors.green,
    ],
    [
      "Banana",
      "50",
      "../assets/images/banana.png",
      Colors.yellow,
    ],
    [
      "Chicken",
      "170",
      "../assets/images/chicken.png",
      Colors.brown,
    ],
    [
      "Water",
      "1.00",
      "../assets/images/water.png",
      Colors.blue,
    ],
  ];

  final List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
