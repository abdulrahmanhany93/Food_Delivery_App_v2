import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FoodController extends ChangeNotifier {
  Map<String, dynamic> foodData = {};
  List foodName = [];

  getData() async {
    foodData = {};
    await FirebaseFirestore.instance
        .collection('home')
        .doc('8eMRwXRWeGVXloLQNea6')
        .get()
        .then((value) => foodData = value.data());

    foodData.values.forEach((e) {
      e.values.forEach((x) {
        foodName.add(x[0]);
      });
    });
    notifyListeners();
  }

}
