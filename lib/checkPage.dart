import 'package:flutter/material.dart';

class CheckPage extends StatelessWidget {
  const CheckPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.15),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check,
              color: Colors.green,
              size: 150,
            ),
            Text(
              'Your Order Has Been Placed ',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.4,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.symmetric(vertical: 50),
                child: Center(
                  child: Text(
                    'Back Home ',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
