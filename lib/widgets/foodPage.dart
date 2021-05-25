import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/foodController.dart';
import 'package:food_app/model/valueChange.dart';
import 'package:food_app/widgets/foodContainer.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ValueChange, FoodController>(
      builder: (context, change, foodController, child) {
        var foods = foodController.food;
        return PageView.builder(
            itemCount: foods.values.length,
            controller: change.foodPageViewController,
            physics: BouncingScrollPhysics(),
            onPageChanged: (int value) {
              change.updateSelected(value);
              change.jumpListView();
            },
            itemBuilder: (context, currentPage) {
              change.jumpListView();
              return GridView.builder(
                  padding: EdgeInsets.only(bottom: 15),
                  itemCount: 5,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 10),
                  itemBuilder: (context, index) => FoodContainer(
                        foodName: foods['${foods.keys.elementAt(currentPage)}']
                            ['$index'][0],
                        foodInfo: foods['${foods.keys.elementAt(currentPage)}']
                            ['$index'][1],
                        foodImage: foods['${foods.keys.elementAt(currentPage)}']
                            ['$index'][2],
                        foodPrice: foods['${foods.keys.elementAt(currentPage)}']
                            ['$index'][3],
                      ));
            });
      },
    );
  }
}
