import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/data/data.dart';
import 'package:food_app/widgets/categoryBar.dart';
import 'package:food_app/widgets/foodPage.dart';
import 'package:food_app/widgets/header.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.15),
      appBar: AppBar(
        toolbarHeight: height * 0.09,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            width: width * 0.15,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              FontAwesomeIcons.search,
              size: 20,
            ),
          )
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Header(title: 'Every Bite a',subTitle: 'Better Burger!',),
        CategoryBar(
          height: height,
          categories: categories,
          width: width,
        ),
        Expanded(child: FoodPage())
      ]),
    );
  }
}
