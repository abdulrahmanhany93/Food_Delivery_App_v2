import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FoodController extends ChangeNotifier {
  Map<String,dynamic> food = {};

  getData() async {
    food = {};
    await  FirebaseFirestore.instance
        .collection('home')
        .doc('8eMRwXRWeGVXloLQNea6')
        .get()
        .then((value) => food = value.data());
    notifyListeners();
  }

}
