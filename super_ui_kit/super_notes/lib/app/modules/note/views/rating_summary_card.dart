import 'package:flutter/material.dart';

import 'package:super_notes/app/data/models/note.dart';
import 'package:super_notes/app/modules/note/views/star_ratings.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class RatingSummaryCardView extends GetView {
  final Rating _rating;
  final void Function()? ontap;
  final double iconSize;
  final double barSize;
  final double barHeight;

  const RatingSummaryCardView(
    this._rating, {
    super.key,
    this.ontap,
    this.iconSize = 20,
    this.barSize = 50,
    this.barHeight = 5,
  });

  @override
  Widget build(BuildContext context) {
    return CSCard(
      onTap: ontap,
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
                      child: CSText.title("${_rating.rating}/5")),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:
                        CSText.label('based on ${_rating.ratingCount} reviews'),
                  ),
                  StarRating(_rating.rating)
                ],
              ),
            ),
            horizontalSpaceSmall,
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      const CSText("5 star"),
                      horizontalSpaceTiny,
                      SizedBox(
                          width: barSize,
                          height: barHeight,
                          child: LinearProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                Get.theme.colorScheme.secondary),
                            backgroundColor: Get.theme.colorScheme.onSecondary,
                            value: (_rating.ratingCount == 0)
                                ? 0
                                : (_rating.fiveStarCount / _rating.ratingCount),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      const CSText("4 star"),
                      horizontalSpaceTiny,
                      SizedBox(
                          width: barSize,
                          height: barHeight,
                          child: LinearProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                Get.theme.colorScheme.secondary),
                            backgroundColor: Get.theme.colorScheme.onSecondary,
                            value: (_rating.ratingCount == 0)
                                ? 0
                                : (_rating.fourStarCount / _rating.ratingCount),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      const CSText("3 star"),
                      horizontalSpaceTiny,
                      SizedBox(
                          width: barSize,
                          height: barHeight,
                          child: LinearProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                Get.theme.colorScheme.secondary),
                            backgroundColor: Get.theme.colorScheme.onSecondary,
                            value: (_rating.ratingCount == 0)
                                ? 0
                                : (_rating.threeStarCount /
                                    _rating.ratingCount),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      const CSText("2 star"),
                      horizontalSpaceTiny,
                      SizedBox(
                          width: barSize,
                          height: barHeight,
                          child: LinearProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                Get.theme.colorScheme.secondary),
                            backgroundColor: Get.theme.colorScheme.onSecondary,
                            value: (_rating.ratingCount == 0)
                                ? 0
                                : (_rating.twoStarCount / _rating.ratingCount),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      const CSText("1 star"),
                      horizontalSpaceTiny,
                      SizedBox(
                          width: barSize,
                          height: barHeight,
                          child: LinearProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                Get.theme.colorScheme.secondary),
                            backgroundColor: Get.theme.colorScheme.onSecondary,
                            value: (_rating.ratingCount == 0)
                                ? 0
                                : (_rating.oneStarCount / _rating.ratingCount),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
