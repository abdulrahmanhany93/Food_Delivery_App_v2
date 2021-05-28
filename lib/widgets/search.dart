import 'package:flutter/material.dart';
import 'package:food_app/model/foodController.dart';
import 'package:food_app/screens/orderPage.dart';
import 'package:provider/provider.dart';

class Search extends SearchDelegate {
  final List<dynamic> foodName;
  String result;

  Search(this.foodName);

  getSpecificData() {}

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(
          Icons.close,
          size: 25,
        ),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: Icon(Icons.arrow_back_ios_sharp),
        onPressed: () => close(context, result));
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestions = foodName.where((element) {
      return element.toLowerCase().contains(query.toLowerCase());
    });
    var foodData;
    Provider.of<FoodController>(context).foodData.values.forEach((e) {
      e.values.forEach((x) {
        if (x[0] == query) {
          foodData = x;
        }
      });
    });

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              result = suggestions.elementAt(index);
              close(context, result);
              Navigator.push(context,
                  MaterialPageRoute(builder: (__) {
                return OrderPage(
                    foodData[0], foodData[1], foodData[2], foodData[3]);
              }));
            },
            title: Text(
              suggestions.elementAt(index),
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = foodName.where((element) {
      return element.toLowerCase().contains(query.toLowerCase());
    });
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              suggestions.elementAt(index),
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              query = suggestions.elementAt(index);

            },
          );
        });
  }
}
