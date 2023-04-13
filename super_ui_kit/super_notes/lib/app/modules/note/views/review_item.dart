import 'package:flutter/material.dart';
import 'package:super_notes/app/data/asset_keys.dart';

import 'package:super_notes/app/data/models/review.dart';
import 'package:super_notes/app/extentions/date_time_ext.dart';
import 'package:super_notes/app/modules/note/views/star_ratings.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class ReviewItem extends GetView {
  final Review _review;
  final void Function()? ontap;
  final double iconSize;

  const ReviewItem(
    this._review, {
    super.key,
    this.ontap,
    this.iconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return CSCard(
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
                  backgroundImage: ((_review.user?.img != null &&
                              _review.user!.img.isNotEmpty)
                          ? NetworkImage(_review.user!.img)
                          : const AssetImage(kProfileImage))
                      as ImageProvider<Object>?,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: CSText.label("${_review.updatedAt.passedTime()} ago")),
            ),
            Expanded(
              flex: 4,
              child: StarRating(_review.value),
            ),
          ],
        ),
        verticalSpaceRegular,
        Row(
          children: [
            Expanded(
              child: CSText(
                _review.text,
                maxLines: 4,
              ),
            ),
          ],
        )
      ],
    );
  }
}
