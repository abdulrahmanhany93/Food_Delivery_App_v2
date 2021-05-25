import 'package:flutter/cupertino.dart';

class ValueChange extends ChangeNotifier {
  final PageController foodPageViewController = PageController();
  final PageController homePageViewController = PageController(initialPage: 2);
  final ScrollController listViewController = ScrollController();
  int selected = 0;
  int currentPage = 2;
  dynamic foodQuantity=1;

  jumpPageView(int value) {
    homePageViewController.animateToPage(value,duration: Duration(seconds: 1),curve: Curves.linearToEaseOut);
  }

  jumpListView() {
    listViewController.animateTo((foodPageViewController.offset / 400) * 100 - 80,
        duration: Duration(milliseconds: 500), curve: Curves.linearToEaseOut);
  }

  updateSelected(int value) {
    selected = value;
    notifyListeners();
  }

  updatePage(value) {
    currentPage = value;
    notifyListeners();
  }

  increaseQuantity(){
    foodQuantity++;
    notifyListeners();
  }
  decreaseQuantity(){
    if(foodQuantity>1){
      foodQuantity--;
    }
    notifyListeners();
  }
  resetQuantity(){
    foodQuantity=1;
    notifyListeners();
  }
}
