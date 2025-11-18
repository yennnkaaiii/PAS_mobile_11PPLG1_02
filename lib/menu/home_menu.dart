import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_02/controller/home_controller.dart';
import 'package:pas_mobile_11pplg1_02/detail_view_page.dart';
import 'package:pas_mobile_11pplg1_02/widget/my_card.dart';
import 'package:pas_mobile_11pplg1_02/widget/my_text.dart';

class HomeMenu extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const MyText(
          text: 'Product List',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E4E5C),
        automaticallyImplyLeading: false, // Menghilangkan back arrow
      ),
      backgroundColor: const Color(0xFF1E4E5C),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.products.isEmpty) {
          return const Center(
            child: MyText(
              text: 'Tidak ada list product',
              fontSize: 16,
              color: Colors.white70,
            ),
          );
        } else {
          return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              final products = controller.products[index];

              return MyCard(
                onTap: () {
                  Get.to(() => DetailViewPage(
                        title: products.name,
                        price: products.price,
                        description: products.description,
                        category: products.category,
                        image: products.image,
                        rating: products.rating,
                      ));
                },
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 4,
                color: const Color(0xFF355A64),
                borderRadius: 15,
                title: products.title,
                image: products.image,
                price: products.price,
                category: products.category,
                description: products.description,
                rating: products.rating,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        products.image.isNotEmpty
                            ? products.badge
                            : 'https://via.placeholder.com/50',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.broken_image,
                            size: 50,
                            color: Colors.white,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: products.id,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const MyText(
                                text: "Name: ",
                                fontSize: 14,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                              ),
                              MyText(
                                text: products.title,
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
