import 'package:get/get.dart';

class DashboardController extends GetxController {
  // posisi terakhir menu
  var selectedIndex = 0.obs;

  void changeMenu(int index) {
    selectedIndex.value = index;
  }
}
