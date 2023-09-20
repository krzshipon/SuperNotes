import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
        height: Get.height / 2.5,
        color: Get.theme.colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CSText.title('sendReview'.tr),
              ),
              verticalSpaceRegular,
              RatingBar.builder(
                initialRating: 5,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Get.theme.colorScheme.secondary,
                ),
                onRatingUpdate: (rating) {
                  controller.rate.value = rating.toInt();
                },
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
                  onTap: () => controller.saveReview(),
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
