import 'package:flutter/material.dart';
class Header extends StatelessWidget {
 final String title;
 final String subTitle;
 final Widget trailing;

 Header(this.title, this.subTitle,{this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
        title: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 30,letterSpacing: 1.5, fontWeight: FontWeight.bold),
        ),
        subtitle: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            subTitle,
            style: TextStyle(color: Colors.white54, fontSize: 20,letterSpacing: 1.5,fontWeight: FontWeight.w500),
          ),
        ),
      trailing:trailing ,
    );
  }
}