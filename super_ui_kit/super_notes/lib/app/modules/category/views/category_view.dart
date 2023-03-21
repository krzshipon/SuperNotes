import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:super_notes/app/modules/category/views/category_card_view.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../../note/views/note_item_card_view.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        children: [
          Obx(
            (() => CSHeader(
                  title: controller.category.value.name,
                  onLeftIconClick: () => controller.onBackPress(),
                )),
          ),
          verticalSpaceSmall,
          Obx(
            (() => (controller.categories.isNotEmpty)
                ? Expanded(
                    child: LiveList.options(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder:
                          animationItemBuilder(((index) => CategoryCardView(
                                controller.categories[index],
                                ontap: () => controller
                                    .openCategory(controller.categories[index]),
                              ))),
                      itemCount: controller.categories.length,
                      options: kAnimationOptions,
                    ),
                  )
                : const Padding(padding: EdgeInsets.zero)),
          ),
          Obx(
            (() => (controller.notes.isNotEmpty)
                ? Expanded(
                    child: LiveList.options(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder:
                          animationItemBuilder(((index) => NoteItemCardView(
                                controller.notes[index],
                                ontap: () => controller
                                    .openNote(controller.notes[index]),
                              ))),
                      itemCount: controller.notes.length,
                      options: kAnimationOptions,
                    ),
                  )
                : const Padding(padding: EdgeInsets.zero)),
          ),
        ],
      ),
    );
  }
}
