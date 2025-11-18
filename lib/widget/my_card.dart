import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_02/controller/task_controller.dart';
import 'package:pas_mobile_11pplg1_02/model/favorite_model.dart';


class MyCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final double elevation;
  final Color color;
  final double borderRadius;

  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final double rating;
  final VoidCallback? onTap;

  MyCard({
    required this.child,
    required this.margin,
    required this.elevation,
    required this.color,
    required this.borderRadius,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
    required this.rating,
    this.onTap,
    required this.description,
  });

  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isFavorite = taskController.isFavorite(title);

      return InkWell(
        onTap: onTap,
        child: Card(
          color: color,
          margin: margin,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: child,
              ),
              Positioned(
                top: 8.0,
                right: 8.0,
                child: GestureDetector(
                  onTap: () async {
                    if (isFavorite) {
                      await taskController.deleteTaskByName(title);
                      Get.snackbar(
                        "Removed from Favorites",
                        "$title telah dihapus dari favorit!",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    } else {
                      await taskController.addTask(
                        FavoriteModel(
                          id: null,
                          strTitle: title,
                          strPrice: '',
                          strDescription: description,
                          strCategory: '',
                          strImage: image,
                          strRating: 0.0,
                          isCompleted: false,
                        ),
                      );
                      Get.snackbar(
                        "Added to Favorites",
                        "$title telah ditambahkan ke favorit!",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                    }
                  },
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
