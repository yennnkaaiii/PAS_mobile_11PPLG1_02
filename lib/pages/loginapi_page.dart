import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_02/controller/loginapi_controller.dart';
import 'package:pas_mobile_11pplg1_02/pages/home_page.dart';
import 'package:pas_mobile_11pplg1_02/pages/registerapi_page.dart';

class LoginApiPage extends StatelessWidget {
  LoginApiPage({super.key});

  final LoginApiController controller = Get.put(LoginApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E4E5C),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 70),

            const Text(
              "Welcome Back!",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Image.asset('assets/images/onepiece.jpg', width: 220, height: 220),

            const SizedBox(height: 25),

            // Username
            TextField(
              controller: controller.username,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.15),
                labelText: 'Username',
                labelStyle: const TextStyle(color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Password Field
            TextField(
              controller: controller.password,
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.15),
                labelText: 'Password',
                labelStyle: const TextStyle(color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Login btn
            Obx(() {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(140, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: controller.isLoading.value
                    ? null
                    : () async {
                        await controller.login();

                        if (controller.loginStatus.value
                            .toLowerCase()
                            .contains("success")) {
                          Get.snackbar(
                            "Login Berhasil",
                            "Selamat datang kembali!",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.green.shade600,
                            colorText: Colors.white,
                          );
                          Get.offAll(() => HomePage());
                        }
                      },
                child: controller.isLoading.value
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              );
            }),

            const SizedBox(height: 20),

            TextButton(
              onPressed: () => Get.to(() => RegisterapiPage()),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              child: const Text("Belum punya akun? Register di sini"),
            ),
          ],
        ),
      ),
    );
  }
}
