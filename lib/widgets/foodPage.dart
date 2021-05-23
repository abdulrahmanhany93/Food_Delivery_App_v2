import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/data/data.dart';
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
    return Consumer<ValueChange>(
      builder: (context, change, child) {
        return PageView.builder(
            itemCount: food.entries.length,
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
                  itemCount: food['category$currentPage'].length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 10),
                  itemBuilder: (context, index) => FoodContainer(
                        foodImage: food['category$currentPage'][index].image,
                        foodName: food['category$currentPage'][index].name,
                        foodInfo: food['category$currentPage'][index].info,
                        foodPrice: food['category$currentPage'][index].price,
                      ));
            });
      },
    );
  }
}
