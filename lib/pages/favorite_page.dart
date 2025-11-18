import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_02/controller/product_controller.dart';
import 'package:pas_mobile_11pplg1_02/widget/widget_bookmark.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();

    return Scaffold(
      backgroundColor: const Color(0xFF1E4E5C),

      appBar: AppBar(
        title: const Text(
          "List Favorite",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF1E4E5C),
      ),

      body: Obx(() {
        final bookmarks =
            controller.products.where((p) => p.isBookmarked).toList();

        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: Colors.white));
        }

        if (bookmarks.isEmpty) {
          return const Center(
            child: Text(
              'No favorite products found.',
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: bookmarks.length,
          itemBuilder: (context, index) {
            final produk = bookmarks[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Material(
                color: const Color(0xFF355A64),
                elevation: 4,
                borderRadius: BorderRadius.circular(16),

                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          produk.image,
                          width: 70,
                          height: 70,
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              produk.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              "\$${produk.price}",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.lightBlueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                     //dialog request
                      WidgetBookmark(
                        initialValue: produk.isBookmarked,

                        onConfirm: (newValue) async {
                      
                          if (newValue == false) {
                           final result = await showDialog<bool>(
  context: context,
  builder: (context) => AlertDialog(
    backgroundColor: const Color(0xFF1E4E5C),
    title: const Text(
      "Hapus dari Favorit?",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    content: Text(
      "Apakah kamu yakin ingin menghapus \"${produk.title}\" dari daftar favorit?",
      style: const TextStyle(color: Colors.white70),
    ),
    actionsPadding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),

    actions: [

      GestureDetector(
        onTap: () => Navigator.pop(context, false),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white70, width: 2),
            color: Colors.white12,
          ),
          child: const Text(
            "Batal",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),

      const SizedBox(width: 10),

      GestureDetector(
        onTap: () => Navigator.pop(context, true),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.redAccent,
          ),
          child: const Text(
            "Hapus",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    ],
  ),
);
                            return result == true;
                          }

                          return true; 
                        },

                        onChanged: (value) => controller.toggleBookmark(produk),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
