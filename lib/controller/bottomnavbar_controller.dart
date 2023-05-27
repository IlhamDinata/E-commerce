import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  var tabindex = 0;
  void changeTabIndex(int index) {
    tabindex = index;
    update();
  }
}
