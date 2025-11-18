import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_02/model/home_model.dart';
import 'package:pas_mobile_11pplg1_02/service/api_service_page.dart';


class HomeController extends GetxController {
  var product = <HomeModel>[].obs; 
  var isLoading = true.obs;

  get products => null;

  @override
  void onInit() {
    fetchCategories(); 
    super.onInit();
  }

  void fetchCategories() async { 
    try {
      isLoading(true);
      await ApiServicePage().fetchCategory();
      if (products != null) {
        product.assignAll(products); 
      }
    } finally {
      isLoading(false);
    }
  }
}
