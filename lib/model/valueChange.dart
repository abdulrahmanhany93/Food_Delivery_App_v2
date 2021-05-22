import 'package:flutter/cupertino.dart';

class ValueChange extends ChangeNotifier {
  final PageController pageViewController = PageController();
  final ScrollController listViewController = ScrollController();
  int selected = 0;
  int currentPage = 2;

  jumpPageView(int value) {
    pageViewController.jumpToPage(value);
  }

  jumpListView() {
    listViewController.animateTo((pageViewController.offset / 400) * 100 - 80,
        duration: Duration(milliseconds: 500), curve: Curves.linearToEaseOut);
  }

  updateSelected(int value) {
    selected = value;
    notifyListeners();
  }

  updatePage(value1) {
    currentPage = value1;
    notifyListeners();
  }
}
