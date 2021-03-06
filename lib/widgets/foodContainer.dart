import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/screens/orderPage.dart';
import 'package:food_app/transtion/transtion.dart';

class FoodContainer extends StatelessWidget {
  final String foodImage;
  final String foodName;
  final String foodInfo;
  final dynamic foodPrice;

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
                Transition.first(
                    OrderPage(foodName, foodInfo, foodImage, foodPrice))),
            child: Hero(
              tag: foodImage,
              child: CachedNetworkImage(
                imageUrl: foodImage,
                placeholder: (context, url) {
                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    strokeWidth: 4,
                  ));
                },
                imageBuilder: (context, provider) {
                  return Image(image: NetworkImage(foodImage));
                },
                useOldImageOnUrlChange: true,
                placeholderFadeInDuration: Duration(seconds: 3),
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
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  Transition.first(
                      OrderPage(foodName, foodInfo, foodImage, foodPrice))),
              child: CircleAvatar(
                  backgroundColor: Colors.black,
                  maxRadius: 15,
                  child: Icon(
                    FontAwesomeIcons.plus,
                    color: Colors.white,
                    size: 15,
                  )),
            )
          ],
        ),
      ],
    );
  }
}
