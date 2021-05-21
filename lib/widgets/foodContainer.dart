import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/screens/orderPage.dart';
import 'package:food_app/transtion/transtion.dart';

class FoodContainer extends StatelessWidget {
  final String foodImage;
  final String foodName;
  final String foodInfo;
  final double foodPrice;

  FoodContainer({this.foodImage, this.foodName, this.foodInfo, this.foodPrice});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => Navigator.push(
                context,
                Transition.fist(OrderPage(foodName, foodInfo, foodImage))),
            child: Hero(
              tag: foodImage,
              child: Image(
                image: NetworkImage(foodImage),
              ),
            ),
          ),
        ),
        ListTile(
          title: Center(
            child: Text(
              foodName,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Center(
            child: Text(
              foodInfo,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              softWrap: true,
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '\$ $foodPrice',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            CircleAvatar(
                backgroundColor: Colors.black,
                maxRadius: 15,
                child: Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                  size: 15,
                ))
          ],
        ),
      ],
    );
  }
}
