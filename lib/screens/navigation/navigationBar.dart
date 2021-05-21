import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/model/valueChange.dart';
import 'package:food_app/screens/navigation/cart.dart';
import 'package:food_app/screens/navigation/favorite.dart';
import 'package:food_app/screens/homePage.dart';
import 'package:food_app/screens/navigation/inbox.dart';
import 'package:food_app/screens/navigation/profile.dart';
import 'package:provider/provider.dart';

class NavigationBar extends StatelessWidget {

  final List<Widget> pages = [
    Inbox(),
    Favorite(),
    HomePage(),
    Cart(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ValueChange>(
        builder: (context,change,child){
          return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.black.withOpacity(0.89),
                elevation: 0,
                selectedItemColor: Colors.orangeAccent,
                unselectedItemColor: Colors.grey,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                currentIndex: change.currentPage,
                iconSize: 25,
                type: BottomNavigationBarType.fixed,
                onTap: (int index) {
                  change.updatePage(index);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.envelope), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.heart), label: ''),
                  BottomNavigationBarItem(
                      icon: CircleAvatar(
                          backgroundColor: Colors.orangeAccent,
                          child: Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                            size: 20,
                          )),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.store), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.user), label: ''),
                ],
              ),
              body: pages[change.currentPage]);
        },
    );
  }
}
