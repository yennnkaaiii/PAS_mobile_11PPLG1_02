
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_02/controller/responsif_controller.dart';
import 'package:pas_mobile_11pplg1_02/dashboard_page.dart';
import 'package:pas_mobile_11pplg1_02/dashboard_tablet.dart';

class ResponsifLayout extends StatelessWidget {
  ResponsifLayout({super.key});

  final ResponsifController responsifController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (responsifController.isMobile()) {
        return DashboardPage();
      } else if (responsifController.isTablet()) {
        return DashboardPageTablet();
      } else {
        return Container();
      }
    });
  }
}
