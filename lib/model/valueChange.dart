import 'package:flutter/cupertino.dart';

class ValueChange extends ChangeNotifier {
  final PageController controller = PageController();
  int selected = 0;
  int currentPage = 2;
  jumpPage(int value) {
    controller.jumpToPage(value);
  }

  updateSelected(int value) {
    selected = value;
    notifyListeners();
  }
  updatePage(value1){
    currentPage=value1;
    notifyListeners();
  }
}
