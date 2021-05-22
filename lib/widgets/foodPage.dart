import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/data/data.dart';
import 'package:food_app/model/valueChange.dart';
import 'package:food_app/widgets/foodContainer.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ValueChange>(
      builder: (context, change, child) {
        return PageView.builder(
            itemCount: food.entries.length,
            controller: change.pageViewController,
            physics: BouncingScrollPhysics(),
            onPageChanged: (int value) {
              change.updateSelected(value);
              change.jumpListView();
            },
            itemBuilder: (context, currentPage) {
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
