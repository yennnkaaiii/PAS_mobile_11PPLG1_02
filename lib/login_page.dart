import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_02/controller/login_controller.dart';
import 'package:pas_mobile_11pplg1_02/widget/my_button.dart';
import 'package:pas_mobile_11pplg1_02/widget/my_text.dart';
import 'package:pas_mobile_11pplg1_02/widget/my_text_field.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xD91E4E5C), Color.fromARGB(255, 203, 242, 254)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 120),
                MyText(
                  text: "Sign in to your account!",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                MyText(
                  text: "Already have an account?",
                  fontSize: 14,
                  color: Colors.white70,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Masukkan Username',
                ),
                SizedBox(height: 16),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Masukkan Password',
                  isObscure: true,
                ),
                SizedBox(height: 16),
                Obx(
                  () => MyButton(
                    text: "Continue",
                    color: Colors.purple,
                    onPressed: controller.isLoading.value
                        ? () {}
                        : () async {
                            bool isLoginSuccessful = await controller.login(
                              usernameController.text,
                              passwordController.text,
                            );
                            if (isLoginSuccessful) {
                              Get.snackbar(
                                "Login Berhasil",
                                "Selamat datang di HomePage!",
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                                borderRadius: 15,
                                margin: const EdgeInsets.all(8.0),
                              );

                              // Get.to(() => HomeMenu());
                              Get.toNamed('/dashboard');
                            } else {
                              Get.snackbar(
                                "Login Gagal",
                                "Periksa username dan password Anda.",
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                borderRadius: 15,
                                margin: const EdgeInsets.all(8.0),
                              );
                            }
                          },
                    isLoading: controller.isLoading.value,
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: MyText(
                        text: "or sign in with",
                        color: Colors.white70,
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.white)),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/google.png', height: 24),
                    Image.asset('assets/iphone.png', height: 24),
                    Image.asset('assets/facebook.png', height: 24),
                  ],
                ),
                SizedBox(height: 70),
                Obx(
                  () => Text(
                    controller.loginStatus.value,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Obx(() => Text(
                      controller.token.value,
                      style: TextStyle(color: Colors.white),
                    )),
                MyText(
                  text: "By clicking Create account you agree to Recognotes",
                  fontSize: 12,
                  color: Colors.white70,
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {},
                  child: MyText(
                    text: "Terms of use and Privacy policy",
                    color: Colors.blue.shade200,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
