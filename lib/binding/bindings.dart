import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_02/controller/dashboard_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut(() => DashboardController());
  }
}