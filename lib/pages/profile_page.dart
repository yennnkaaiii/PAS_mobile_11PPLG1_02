import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_02/controller/profile_controller.dart';
import 'package:pas_mobile_11pplg1_02/widget/widget_button.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E4E5C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E4E5C),
        title: const Text(
          "Profil Saya",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            const SizedBox(height: 20),

            const Text(
              "Halo, kaiixxitters!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white, 
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "admnxx10773kai@gmail.com",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70, 
              ),
            ),

            const SizedBox(height: 30),

            CustomButton(
              text: "Log Out",
              textColor: Colors.red,
              onPressed: () {
                controller.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
