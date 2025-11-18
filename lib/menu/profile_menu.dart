import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_02/login_page.dart';
import 'package:pas_mobile_11pplg1_02/widget/my_text.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E4E5C),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                ),
                Positioned(
                  top: 150,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                      SizedBox(height: 20),
                      MyText(
                        text: 'Aldikky Arfian S',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.location_on,
                  color: Colors.grey,
                  size: 18,
                ),
                SizedBox(width: 5),
                MyText(
                  text: 'Kudus, Central Java, Indonesian',
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ],
            ),

            const SizedBox(height: 60),
            const MyText(
              text: 'Achievement',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            const SizedBox(height: 10),

            Wrap(
              spacing: 10.0,
              children: const [
                Chip(
                  label: MyText(
                    text: 'Suka Membaca',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xFF142C34),
                  avatar: Icon(Icons.book, color: Colors.white, size: 18),
                ),
                Chip(
                  label: MyText(
                    text: 'Penjelajah Team',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xFF142C34),
                  avatar: Icon(Icons.search, color: Colors.white, size: 18),
                ),
                Chip(
                  label: MyText(
                    text: 'Team Favorite',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xFF142C34),
                  avatar: Icon(Icons.star, color: Colors.white, size: 18),
                ),
                Chip(
                  label: MyText(
                    text: 'Master Dokumen',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xFF142C34),
                  avatar:
                      Icon(Icons.document_scanner, color: Colors.white, size: 18),
                ),
                Chip(
                  label: MyText(
                    text: 'Penggila Team',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xFF142C34),
                  avatar: Icon(Icons.local_fire_department_sharp,
                      color: Colors.white, size: 18),
                ),
                Chip(
                  label: MyText(
                    text: 'Penggemar Bola',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xFF142C34),
                  avatar:
                      Icon(Icons.sports_basketball, color: Colors.white, size: 18),
                ),
              ],
            ),

            const SizedBox(height: 50),

            // 🔥 TOMBOL LOGOUT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Hapus semua history dan kembali ke LoginPage
                  Get.offAll(() => LoginPage());
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
