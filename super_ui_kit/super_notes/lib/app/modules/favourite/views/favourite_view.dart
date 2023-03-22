import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:super_notes/app/modules/note/views/note_item_card_view.dart';
import 'package:super_ui_kit/super_ui_kit.dart';


import '../controllers/favourite_controller.dart';

class FavouriteView extends GetView<FavouriteController> {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        children: [
          CSHeader(
            title: 'fvNotes'.tr,
          ),
          verticalSpaceSmall,
          Expanded(
            child: Obx(
              () => (controller.notes.isNotEmpty)
                  ? LiveList.options(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder:
                          animationItemBuilder(((index) => NoteItemCardView(
                                controller.notes[index],
                                ontap: () => controller
                                    .gotoNoteView(controller.notes[index].id.hexString),
                              ))),
                      itemCount: controller.notes.length,
                      options: kAnimationOptions,
                    )
                  : const CSText.label("No item found!"),
            ),
          ),
        ],
      ),
    );
  }
}
