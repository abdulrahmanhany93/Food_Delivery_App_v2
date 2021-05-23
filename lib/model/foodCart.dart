import 'package:flutter/cupertino.dart';
import 'package:food_app/model/cartItems.dart';

class FoodCart extends ChangeNotifier {
  List<CartItems> cart = [];

  addToCart(
      String foodImage, String foodName, int foodQuantity, double totalPrice) {
    CartItems newCart =
        CartItems(foodImage, foodName, foodQuantity, totalPrice);
    cart.add(newCart);
    notifyListeners();
  }

  removeFromCart(String foodName) {
    cart.removeAt(cart.indexWhere((element) => element.foodName == foodName));
    notifyListeners();
  }
}
