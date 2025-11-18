import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_02/controller/dashboard_controller.dart';
import 'package:pas_mobile_11pplg1_02/menu/favorite_menu.dart';
import 'package:pas_mobile_11pplg1_02/menu/profile_menu.dart';
import 'package:pas_mobile_11pplg1_02/tablet_layout/home_menu_tablet.dart';

class DashboardPageTablet extends StatelessWidget {
  const DashboardPageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController =
        Get.put(DashboardController());

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double iconSize = (screenWidth * 0.02 + screenHeight * 0.02);
    double padding = screenWidth * 0.01;

    final List<Widget> menus = [
      HomeMenuTablet(),
      FavoriteMenu(),
      ProfileMenu()
    ];

    return Obx(() {
      return Scaffold(
        backgroundColor: const Color(0xFF1A1A2E),
        body: Row(
          children: [
            _buildSideMenu(dashboardController, iconSize, padding),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                child: menus[dashboardController.selectedIndex.value],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildSideMenu(
      DashboardController controller, double iconSize, double padding) {
    final List<Map<String, dynamic>> menuItems = [
      {'icon': Icons.home_outlined, 'label': 'Home'},
      {'icon': Icons.favorite, 'label': 'Favorite'},
      {'icon': Icons.person, 'label': 'Profile'},
    ];

    return Container(
      width: 80,
      padding: EdgeInsets.symmetric(vertical: padding * 2),
      decoration: BoxDecoration(
        color: const Color(0xFF142C34),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: menuItems.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> item = entry.value;

          return GestureDetector(
            onTap: () {
              controller.selectedIndex.value = index;
            },
            child: _buildMenuIcon(
              icon: item['icon'],
              label: item['label'],
              isSelected: controller.selectedIndex.value == index,
              iconSize: iconSize,
              padding: padding,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMenuIcon({
    required IconData icon,
    required String label,
    required bool isSelected,
    required double iconSize,
    required double padding,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(vertical: padding / 2),
      padding: EdgeInsets.all(isSelected ? padding : padding / 2),
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
      child: Column(
        children: [
          Icon(
            icon,
            size: isSelected ? iconSize + 6 : iconSize,
            color: isSelected ? Colors.white : Colors.grey[500],
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[500],
              fontSize: 8,
            ),
          ),
        ],
      ),
    );
  }
}
