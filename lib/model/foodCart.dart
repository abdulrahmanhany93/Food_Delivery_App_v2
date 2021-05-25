import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/cartItems.dart';

class FoodCart extends ChangeNotifier {
  List<CartItems> cart = [];
  double totalPrice = 0;

  addToCart(String foodImage, String foodName, dynamic foodQuantity,
      dynamic totalPrice) {
    if (cart.any((element) => element.foodName == foodName)) {
      cart.forEach((element) {
        if (element.foodName == foodName) {
          element.foodQuantity += foodQuantity;
        }
      });
    } else {
      CartItems newCart =
          CartItems(foodImage, foodName, foodQuantity, totalPrice);
      cart.add(newCart);
    }
    notifyListeners();
  }

  removeFromCart(String foodName) {
    cart.removeAt(cart.indexWhere((element) => element.foodName == foodName));
    notifyListeners();
  }

  makeOrder() {
    Map<String, dynamic> order = {
      'food': [],
      'totalPrice': 0,
      'Time': DateTime.now()
    };
    cart.forEach((element) {
      totalPrice += element.totalPrice;
      order['food'].add(
          '${element.foodQuantity} x  ${element.foodName}   ${element.totalPrice}\$ ');
    });
    order['totalPrice'] = totalPrice;
    FirebaseFirestore.instance.collection('order').add(order);
    cart.clear();
    totalPrice = 0;
    notifyListeners();
  }
}
