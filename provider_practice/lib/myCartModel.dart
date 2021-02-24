import 'package:flutter/material.dart';

class MyCart extends ChangeNotifier {
  List cartList = [];

  addToCart(int index) {
    cartList.add(index);
    notifyListeners();
    print(index);
  }

  removeCart() {
    cartList.removeLast();
    notifyListeners();
    print(cartList);
  }
}

