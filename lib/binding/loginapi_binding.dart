import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_02/controller/loginapi_controller.dart';

class LoginBindingApi extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginApiController>(() => LoginApiController());
  }

}