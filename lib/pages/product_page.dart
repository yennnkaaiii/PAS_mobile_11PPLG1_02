import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_02/controller/product_controller.dart';
import 'package:pas_mobile_11pplg1_02/widget/widget_bookmark.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E4E5C),

      appBar: AppBar(
        title: const Text(
          "List Product",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E4E5C),
        elevation: 0,
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: Colors.white));
        }

        return RefreshIndicator(
          onRefresh: () async => controller.fetchProducts(),

          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),

            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              final produk = controller.products[index];

              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Material(
                  color: const Color(0xFF355A64),
                  elevation: 4,
                  borderRadius: BorderRadius.circular(16),

                  child: Container(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            produk.image,
                            width: 80,
                            height: 80,
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

                        WidgetBookmark(
                          initialValue: produk.isBookmarked,
                          onChanged: (value) => controller.toggleBookmark(produk),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}