import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:super_notes_admin/app/data/models/category.dart';
import 'package:super_notes_admin/app/modules/note_add/controllers/note_add_controller.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class CategoryDialogViewView extends GetView<NoteAddController> {
  const CategoryDialogViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 1.5,
      width: Get.width / 1.2,
      padding: const EdgeInsets.all(30),
      child: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) => DropdownButton<Category>(
            value: controller.selectedValues[index],
            items: controller.categoriesList[index].map((Category category) {
              return DropdownMenuItem<Category>(
                value: category,
                child: Text(category.name),
              );
            }).toList(),
            onChanged: ((value) => controller.onCategoryChanged(index, value)),
          ),
          shrinkWrap: true,
          itemCount: controller.categoriesList.length,
        ),
      ),
    );
  }
}
