import 'package:flutter/material.dart';
import 'package:food_app/model/foodCart.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodCart>(
      builder: (context, cart, child) {
        return Scaffold(
          backgroundColor: Colors.black.withOpacity(0.89),
          body: SafeArea(
            child: cart.cart.isEmpty
                ? Center(
                    child: Text(
                      'Empty Cart',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: cart.cart.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(15))),
                              child: Center(
                                child: Image(
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                    image: NetworkImage(
                                        cart.cart[index].foodImage)),
                              ),
                            ),
                            Expanded(
                                child: ListTile(
                              leading: Text(
                                '${cart.cart[index].foodQuantity} x',
                                style: TextStyle(
                                    height: 2,
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900),
                              ),
                              title: Text(cart.cart[index].foodName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              trailing: CircleAvatar(
                                  maxRadius: 15,
                                  backgroundColor: Colors.black,
                                  child:  InkWell(
                                    onTap: ()=>cart.removeFromCart(cart.cart[index].foodName),
                                    child: Icon(
                                      Icons.close,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),),
                            ))
                          ],
                        ),
                      );
                    },
                  ),
          ),
          bottomNavigationBar: cart.cart.isEmpty
              ? null
              : Container(
            margin: EdgeInsets.only(bottom: 10),
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          trailing: Container(
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                    topRight: Radius.circular(25))),
                            child: Center(
                              child: Text(
                                'Order Now',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
        );
      },
    );
  }
}
