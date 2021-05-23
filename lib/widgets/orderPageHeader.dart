import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/model/valueChange.dart';
import 'package:provider/provider.dart';

class OrderPageHeader extends StatefulWidget {
  OrderPageHeader({
    Key key,
    @required this.foodName,
  }) : super(key: key);

  final String foodName;

  @override
  _OrderPageHeaderState createState() => _OrderPageHeaderState();
}

class _OrderPageHeaderState extends State<OrderPageHeader> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ValueChange>(
      builder: (context,change,child){
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.foodName,
                style: TextStyle(
                    color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              color: Colors.white.withOpacity(0.2),
              width: 110,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: ()=>change.increaseQuantity(),
                    child: Container(
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
                  ),
                  Text(change.foodQuantity.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: ()=>change.decreaseQuantity(),
                    child: Container(
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
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
