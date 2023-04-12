import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/review_controller.dart';

class ReviewView extends GetView<ReviewController> {
  const ReviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        height: Get.height / 3,
        color: Get.theme.colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CSText.title('sendFeedback'.tr),
              ),
              verticalSpaceRegular,
              CSInputField(
                controller: controller.tcReview,
                maxLines: 4,
              ),
              verticalSpaceRegular,
              Align(
                alignment: Alignment.centerRight,
                child: CSIconButton(
                  ontap: () => controller.saveReview(),
                  icon: Icons.send_sharp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}