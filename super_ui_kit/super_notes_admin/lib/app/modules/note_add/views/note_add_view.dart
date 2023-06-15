import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../../../data/models/category.dart';
import '../controllers/note_add_controller.dart';

class NoteAddView extends GetView<NoteAddController> {
  const NoteAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(right: 5),
      children: [
        verticalSpaceRegular,
        const CSHeader(
          title: "Add a note", //TODO: remove hard code value
          showLeading: false,
        ),
        verticalSpaceMedium,
        CSInputField(
          controller: controller.titleController,
          placeholder: 'Title'.tr,
          maxLines: 2,
        ),
        verticalSpaceMedium,
        CSInputField(
          controller: controller.descController,
          placeholder: 'Description'.tr,
          maxLines: 4,
        ),
        verticalSpaceMedium,
        CSInputField(
          controller: controller.srcController,
          placeholder: 'Src'.tr,
          maxLines: 1,
        ),
        verticalSpaceMedium,
        CSInputField(
          controller: controller.authorController,
          placeholder: 'Author'.tr,
          maxLines: 1,
        ),
        verticalSpaceMedium,
        CSInputField(
          controller: controller.authorCreditController,
          placeholder: 'Author Credit'.tr,
          maxLines: 1,
        ),
        verticalSpaceMedium,
        CSInputField(
          controller: controller.coverAnimController,
          placeholder: 'Cover Animation'.tr,
          maxLines: 1,
        ),
        verticalSpaceMedium,
        CSInputField(
          controller: controller.prevController,
          placeholder: 'Previews Links'.tr,
          maxLines: 2,
        ),
        verticalSpaceLarge,
        Obx(
          () => ListView.builder(
            itemBuilder: (context, index) => Row(children: [
              CSText(controller.selectedCategories[index].name),
              horizontalSpaceMedium,
              CSButton.outline(
                title: "Delete".tr,
                onTap: () => controller.deleteSelection(index),
              )
            ]),
            shrinkWrap: true,
            itemCount: controller.selectedCategories.length,
          ),
        ),
        verticalSpaceMedium,
        CSButton.outline(
          title: "Select Category".tr,
          onTap: () => controller.addCategory(),
        ),
        verticalSpaceLarge,
        CSButton.outline(
          title: "Save Note".tr,
          onTap: () => controller.addNote(),
        ),
        verticalSpaceLarge,
      ],
    );
  }
}
