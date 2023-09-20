import 'package:flutter/material.dart';
import 'package:super_notes/app/data/asset_keys.dart';
import 'package:super_notes/app/modules/note/views/rating_summary_card.dart';
import 'package:super_notes/app/modules/note/views/review_item.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/note_controller.dart';

class NoteView extends GetView<NoteController> {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      floatingActionButton: CSIconButton(
        onTap: () => controller.gotoReadNote(),
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
                            onTap: () {
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
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: CSIconButton(
                              icon: Icons.arrow_back_ios_new_sharp,
                              onTap: () => controller.bacwardPreview(),
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
                                    ? controller
                                            .note
                                            .value
                                            .previews[controller
                                                .currentPreviewIdx.value]
                                            .isNotEmpty
                                        ? Image.network(
                                            controller.note.value.previews[
                                                controller
                                                    .currentPreviewIdx.value],
                                          )
                                        : CSText.label('noPreview'.tr)
                                    : CSText.label('noPreview'.tr),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: CSIconButton(
                              icon: Icons.arrow_forward_ios_sharp,
                              onTap: () => controller.forwardPreview(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpaceRegular,
                if (controller.note.value.topReviews.isNotEmpty)
                  Align(
                    alignment: Alignment.center,
                    child: CSText.label('reviews'.tr),
                  ),
                if (controller.note.value.userRating != null)
                  Obx(
                    () => RatingSummaryCardView(
                        controller.note.value.userRating!),
                  ),
                verticalSpaceRegular,
                Align(
                  alignment: Alignment.center,
                  child: CSText.title('User Reviews'.tr),
                ),
                Obx(
                  (() => (controller.note.value.topReviews.isNotEmpty)
                      ? Expanded(
                          child: LiveList.options(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder:
                                animationItemBuilder(((index) => ReviewItem(
                                      controller.note.value.topReviews[index],
                                    ))),
                            itemCount: controller.note.value.topReviews.length,
                            options: kAnimationOptions,
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Align(
                            alignment: Alignment.center,
                            child: CSText.label("No review yet!"),
                          ))),
                ),
                verticalSpaceRegular,
                CSButton.outline(
                  title: "Add a review",
                  onTap: () => controller.addReview(),
                ),
                verticalSpaceRegular
              ],
            ),
          ),
        ],
      ),
    );
  }
}
