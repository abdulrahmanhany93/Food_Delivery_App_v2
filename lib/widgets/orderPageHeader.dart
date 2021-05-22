import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderPageHeader extends StatelessWidget {
  const OrderPageHeader({
    Key key,
    @required this.foodName,
  }) : super(key: key);

  final String foodName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            foodName,
            style: TextStyle(
                color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          color: Colors.white.withOpacity(0.2),
          width: 100,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: Center(
                    child: Icon(
                      FontAwesomeIcons.plus,
                      size: 15,
                    )),
              ),
              Text('1',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: Center(
                    child: Icon(
                      FontAwesomeIcons.minus,
                      size: 15,
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}