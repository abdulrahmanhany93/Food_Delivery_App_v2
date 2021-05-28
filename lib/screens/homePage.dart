import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/model/foodController.dart';
import 'package:food_app/widgets/categoryBar.dart';
import 'package:food_app/widgets/foodPage.dart';
import 'package:food_app/widgets/header.dart';
import 'package:food_app/widgets/search.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final FoodController food;

  HomePage(this.food);

  List foodNames = FoodController().foodName;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<FoodController>(builder: (context, foodController, child) {
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
              child: IconButton(
                iconSize: 20,
                alignment: Alignment.center,
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: Search(foodController.foodName));
                },
                icon: Icon(
                  FontAwesomeIcons.search,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Header(
            title: 'Every Bite a',
            subTitle: 'Better Burger!',
          ),
          CategoryBar(
            height: height,
            width: width,
          ),
          Expanded(child: FoodPage())
        ]),
      );
    });
  }

  @override
  void initState() {
    widget.food.getData();
    super.initState();
  }
}
