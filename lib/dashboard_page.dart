import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_02/controller/dashboard_controller.dart';
import 'package:pas_mobile_11pplg1_02/menu/favorite_menu.dart';
import 'package:pas_mobile_11pplg1_02/menu/home_menu.dart';
import 'package:pas_mobile_11pplg1_02/menu/profile_menu.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController =
        Get.put(DashboardController());

    final List<Widget> menus = [HomeMenu(), FavoriteMenu(), ProfileMenu()];

    return Obx(() {
      return Scaffold(
        backgroundColor: const Color(0xFF1A1A2E),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: menus[dashboardController.selectedIndex.value],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: dashboardController.selectedIndex.value,
          onTap: (index) {
            dashboardController.selectedIndex.value = index;
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[500],
          backgroundColor: const Color(0xFF142C34),
          iconSize: 24.0,
          type: BottomNavigationBarType.fixed,
          items: [
            _buildNavigationBarItem(
              icon: Icons.home_outlined,
              label: "Home",
              isSelected: dashboardController.selectedIndex.value == 0,
            ),
            _buildNavigationBarItem(
              icon: Icons.favorite,
              label: "Favorite",
              isSelected: dashboardController.selectedIndex.value == 1,
            ),
            _buildNavigationBarItem(
              icon: Icons.person,
              label: "Profile",
              isSelected: dashboardController.selectedIndex.value == 2,
            ),
          ],
        ),
      );
    });
  }

  BottomNavigationBarItem _buildNavigationBarItem({
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(isSelected ? 8.0 : 4.0),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1E4E5C) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
                  const BoxShadow(
                    color: Colors.white,
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey[500],
          size: isSelected ? 28.0 : 24.0,
        ),
      ),
      label: label,
    );
  }
}
