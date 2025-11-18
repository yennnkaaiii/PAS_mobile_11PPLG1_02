import 'package:get/get_navigation/get_navigation.dart';
import 'package:pas_mobile_11pplg1_02/binding/loginapi_binding.dart';
import 'package:pas_mobile_11pplg1_02/binding/registerapi_binding.dart';
import 'package:pas_mobile_11pplg1_02/binding/splashscreen_binding.dart';
import 'package:pas_mobile_11pplg1_02/pages/home_page.dart';
import 'package:pas_mobile_11pplg1_02/pages/loginapi_page.dart';
import 'package:pas_mobile_11pplg1_02/pages/registerapi_page.dart';
import 'package:pas_mobile_11pplg1_02/pages/splashscreen_page.dart';
import 'package:pas_mobile_11pplg1_02/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.homepage, page: () => HomePage()),
    GetPage(
      name: AppRoutes.register,
      binding: RegisterapiBinding(),
      page: () => RegisterapiPage(),
    ),
    GetPage(
      name: AppRoutes.login,
      binding: LoginBindingApi(),
      page: () => LoginApiPage(),
    ),
    GetPage(
      name: AppRoutes.splashscreen,
      binding: SplashscreenBinding(),
      page: () => SplashscreenPage(),
    ),
  ];
}