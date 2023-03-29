import 'package:flutter/material.dart';
import 'package:super_notes/app/data/asset_keys.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/note_controller.dart';

class NoteView extends GetView<NoteController> {
  const NoteView({super.key});

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
          Stack(
            children: [
              LottieBuilder.asset(kaDashboardFeaturedAnim),
              const Positioned(
                left: -15,
                right: 0,
                child: CSHeader(),
              ),
            ],
          ),
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
                            icon: controller.note.value.isFav
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
                        Expanded(
                          child: Center(
                            child: CSIconButton(
                              icon: Icons.arrow_back_ios_new_sharp,
                              ontap: () => controller.bacwardPreview(),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            height: 300,
                            color: kCardBackgroundColor,
                            child: Center(
                              child: Obx(
                                () => controller.note.value.previews.isNotEmpty
                                    ? Image.network(
                                        controller.note.value.previews[
                                            controller.currentPreviewIdx.value],
                                      )
                                    : CSText.label('noPreview'.tr),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: CSIconButton(
                              icon: Icons.arrow_forward_ios_sharp,
                              ontap: () => controller.forwardPreview(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpaceRegular,
                Align(
                  alignment: Alignment.center,
                  child: CSText.label('reviews'.tr),
                ),
                CSCard(
                  cardType: CSCardType.item,
                  elevation: 0,
                  childrens: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: CSText.title("4.5/5")),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: CSText.label('based on 100 reviews')),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star_half,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        horizontalSpaceSmall,
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CSText("5 star"),
                                  horizontalSpaceTiny,
                                  SizedBox(
                                      width: 50,
                                      height: 5,
                                      child: LinearProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.blueAccent),
                                        backgroundColor: Colors.white,
                                        value: 0.8,
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  CSText("4 star"),
                                  horizontalSpaceTiny,
                                  SizedBox(
                                      width: 50,
                                      height: 5,
                                      child: LinearProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.blueAccent),
                                        backgroundColor: Colors.white,
                                        value: 0.6,
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  CSText("3 star"),
                                  horizontalSpaceTiny,
                                  SizedBox(
                                      width: 50,
                                      height: 5,
                                      child: LinearProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.blueAccent),
                                        backgroundColor: Colors.white,
                                        value: 0.2,
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  CSText("2 star"),
                                  horizontalSpaceTiny,
                                  SizedBox(
                                      width: 50,
                                      height: 5,
                                      child: LinearProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.blueAccent),
                                        backgroundColor: Colors.white,
                                        value: 0.1,
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  CSText("1 star"),
                                  horizontalSpaceTiny,
                                  SizedBox(
                                      width: 50,
                                      height: 5,
                                      child: LinearProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.blueAccent),
                                        backgroundColor: Colors.white,
                                        value: 0.0,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpaceRegular,
                Align(
                  alignment: Alignment.center,
                  child: CSText.label('User Reviews'.tr),
                ),
                CSCard(
                  cardType: CSCardType.item,
                  childrens: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CircleAvatar(
                              radius: 10,
                              foregroundColor: Get.theme.colorScheme.secondary,
                              backgroundColor: Get.theme.colorScheme.secondary,
                              backgroundImage: const AssetImage(kProfileImage),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: CSText.label('29hours ago')),
                        ),
                        Expanded(
                          flex: 3,
                          child: Align(
                              alignment: Alignment.center,
                              child: CSText('4.5')),
                        ),
                      ],
                    ),
                    verticalSpaceRegular,
                    Row(
                      children: [
                        Expanded(
                          child: CSText(
                            'This is a nice note',
                            maxLines: 4,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                verticalSpaceTiny,
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
