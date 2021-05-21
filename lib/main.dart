import 'package:flutter/material.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(providers: [
        ChangeNotifierProvider<ValueChange>(create: (context) => ValueChange()),
      ], child: NavigationBar()),
    );
  }
}
