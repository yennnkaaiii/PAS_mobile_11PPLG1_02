import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_02/controller/task_controller.dart';
import 'package:pas_mobile_11pplg1_02/widget/my_card.dart';
import 'package:pas_mobile_11pplg1_02/widget/my_imagefav.dart';
import 'package:pas_mobile_11pplg1_02/widget/my_text.dart';


class FavoriteMenu extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    taskController.loadTasks();

    return Scaffold(
      appBar: AppBar(
        title: const MyText(
          text: 'Favorite Team',
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
        if (taskController.tasks.isEmpty) {
          return const Center(
            child: MyText(
              text: 'Anda belum menambahkan apapun ke daftar favorite.',
              fontSize: 16,
              color: Colors.white,
            ),
          );
        }
        return GridView.builder(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: taskController.tasks.length,
          itemBuilder: (context, index) {
            final task = taskController.tasks[index];
            return MyCard(
              margin: const EdgeInsets.all(8),
              elevation: 4,
              color: const Color(0xFF355A64),
              borderRadius: 12,
              title: task.strTitle,
              price: task.strPrice,
              description: task.strDescription,
              category: task.strCategory,
              image: task.strImage,
              rating: task.strRating,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyImageFav(
                    imageName: task.strImage,
                    width: 80,
                    height: 80,
                    borderRadius: 8,
                    fit: BoxFit.cover,
                  ),
                  MyText(
                    text: task.strTitle,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
