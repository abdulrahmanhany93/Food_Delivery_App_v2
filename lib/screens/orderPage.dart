import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/model/foodCart.dart';
import 'package:food_app/model/valueChange.dart';
import 'package:food_app/widgets/orderPageHeader.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatelessWidget {
  final String foodImage;
  final String foodName;
  final String foodInfo;
 final dynamic foodPrice;

  OrderPage(this.foodName, this.foodInfo, this.foodImage, this.foodPrice);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var foodQuantity =
        Provider.of<ValueChange>(context, listen: true).foodQuantity;
    var totalPrice =
        (Provider.of<ValueChange>(context, listen: true).foodQuantity *
            foodPrice);
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
              width: 100,
              height: 200,
              image: NetworkImage(foodImage),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: OrderPageHeader(foodName: foodName),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
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
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 15),
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
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          trailing: Consumer<FoodCart>(
           builder: (context,cart,child){
             return GestureDetector(
               onTap: () {
                 cart.addToCart(
                     foodImage, foodName, foodQuantity, totalPrice);
                 Navigator.pop(context);
                 Provider.of<ValueChange>(context, listen: false).resetQuantity();
               },
               child: Container(
                 width: 150,
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
                           'Add To Cart',
                           style: TextStyle(
                               color: Colors.white,
                               fontSize: 20,
                               fontWeight: FontWeight.bold),
                         ),
                         CircleAvatar(
                           backgroundColor: Colors.white,
                           maxRadius: 15,
                           child: Icon(
                             Icons.shopping_bag_outlined,
                             size: 25,
                             color: Colors.black,
                           ),
                         )
                       ],
                     )
                 ),
               ),
             );
           }
          ),
          ),
        ),

    );
  }
}
