import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';


import '../controllers/note_controller.dart';

class NoteView extends GetView<NoteController> {
  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      floatingActionButton: CSIconButton(
        ontap: () => controller.gotoReadNote(),
        text: 'readNow'.tr,
        icon: Icons.fullscreen_sharp,
      ),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        children: [
          // Stack(
          //   children: [
          //     LottieBuilder.asset(kaDashboardFeaturedLottieFile),
          //     const Positioned(
          //       left: -15,
          //       right: 0,
          //       child: CSHeader(),
          //     ),
          //   ],
          // ),
          verticalSpaceSmall,
          Expanded(
            child: ListView(
              children: [
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CSText.title(controller.note.value.title),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Obx(
                          () => CSIconButton(
                            text: '${controller.note.value.rating}',
                            icon: true ?? false //TODO: Need to updated
                                ? Icons.favorite_sharp
                                : Icons.favorite_outline_sharp,
                            color: Get.theme.colorScheme.primary,
                            ontap: () {
                              controller.updateLikeStatus();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CSText.label('author'
                      .trParams({'name': controller.note.value.authorName})),
                ),
                verticalSpaceSmall,
                Align(
                  alignment: Alignment.centerLeft,
                  child: CSText.title(controller.note.value.desc),
                ),
                verticalSpaceRegular,
                Align(
                  alignment: Alignment.center,
                  child: CSText.label('previews'.tr),
                ),
                CSCard(
                  cardType: CSCardType.item,
                  childrens: [
                    Row(
                      children: [
                        const Expanded(
                          child: Center(
                            child: CSIconButton(
                              icon: Icons.arrow_back_ios_new_sharp,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            height: 300,
                            color: kCardBackgroundColor,
                            child: Center(
                              child: CSText.label('noPreview'.tr),
                            ),
                          ),
                        ),
                        const Expanded(
                            child: Center(
                                child: CSIconButton(
                          icon: Icons.arrow_forward_ios_sharp,
                        )))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
