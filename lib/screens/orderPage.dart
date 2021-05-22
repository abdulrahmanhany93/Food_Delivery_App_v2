import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/widgets/orderPageHeader.dart';

class OrderPage extends StatelessWidget {
  final String foodImage;
  final String foodName;
  final String foodInfo;
  final double foodPrice;


  OrderPage(this.foodName, this.foodInfo, this.foodImage,this.foodPrice);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.withOpacity(0.01),
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
      body: ListView(

        children: [
          Hero(
            tag: foodImage,
            child: Image(
              image: NetworkImage(foodImage),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: OrderPageHeader(foodName: foodName),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 7, right: 8),
            child: Text(
              foodInfo,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 17,
              ),
            ),
          ),

        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: ListTile(
          title: Text(
            'Total Price',
            style: TextStyle(
                color: Colors.white70,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'EGP $foodPrice',
            style: TextStyle(
                color: Colors.white,
                fontSize:35,
                fontWeight: FontWeight.bold),
          ),
          trailing: Container(
            width: 200,
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Order Now',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 20,
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 25,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
