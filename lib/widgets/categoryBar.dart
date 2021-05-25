import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/model/foodController.dart';
import 'package:food_app/model/valueChange.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CategoryBar extends StatefulWidget {
  CategoryBar({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  _CategoryBarState createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ValueChange,FoodController>(
      builder: (contexts, change,food, child) {
        return Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            height: widget.height * 0.07,
            child: ListTile(
              title: ListView.builder(
                controller: change.listViewController,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: food.food.keys.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: widget.width * 0.1),
                    child: Row(
                      children: [
                        AnimatedContainer(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          height: 10,
                          width: 10,
                          duration: Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: change.selected == index
                                  ? Colors.orangeAccent
                                  : Colors.transparent),
                        ),
                        Text(
                          food.food.keys.elementAt(index),
                          style: TextStyle(
                              color: change.selected == index
                                  ? Colors.white
                                  : Colors.white12,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  );
                },
              ),
              trailing: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    FontAwesomeIcons.slidersH,
                    color: Colors.white,
                    size: 20,
                  )),
            ));
      },
    );
  }
}
