import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_02/controller/registerapi_controller.dart';

class RegisterapiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterapiController>(() => RegisterapiController());
  }

}