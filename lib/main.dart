import 'package:flutter/material.dart';
import 'package:food_app/model/foodCart.dart';
import 'package:food_app/model/valueChange.dart';
import 'package:food_app/screens/navigation/navigationBar.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ValueChange>(create: (context) => ValueChange()),
        ChangeNotifierProvider<FoodCart>(create: (context) => FoodCart()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavigationBar(),
      ),
    );
  }
}
