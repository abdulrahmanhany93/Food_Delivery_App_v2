import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/widgets/header.dart';

class OrderPage extends StatelessWidget {
  final String foodName;
  final String foodInfo;
  final String foodImage;

  OrderPage(this.foodName, this.foodInfo, this.foodImage);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.1),
      appBar: AppBar(
        toolbarHeight: height * 0.1,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.white,
          iconSize: 25,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_sharp,
          ),
        ),
        actions: [
          Container(
            width: width * 0.1,
            child: Icon(
              FontAwesomeIcons.ellipsisV,
              size: 20,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Hero(
            tag: foodImage,
            child: Image(
              image: NetworkImage(foodImage),
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Header(
            foodName,
            foodInfo,
            trailing: Container(
              color: Colors.white.withOpacity(0.2),
              width: 110,
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
          )
        ],
      ),
    );
  }
}
