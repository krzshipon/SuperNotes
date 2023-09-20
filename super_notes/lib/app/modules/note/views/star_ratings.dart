import 'package:flutter/material.dart';

import 'package:super_ui_kit/super_ui_kit.dart';

class StarRating extends GetView {
  final double _rating;
  final double iconSize;

  const StarRating(
    this._rating, {
    super.key,
    this.iconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (_rating >= 1)
            ? Icon(
                Icons.star,
                size: iconSize,
              )
            : (_rating >= 0.5)
                ? Icon(
                    Icons.star_half,
                    size: iconSize,
                  )
                : Icon(
                    Icons.star_border,
                    size: iconSize,
                  ),
        (_rating >= 2)
            ? Icon(
                Icons.star,
                size: iconSize,
              )
            : (_rating >= 1.5)
                ? Icon(
                    Icons.star_half,
                    size: iconSize,
                  )
                : Icon(
                    Icons.star_border,
                    size: iconSize,
                  ),
        (_rating >= 3)
            ? Icon(
                Icons.star,
                size: iconSize,
              )
            : (_rating >= 2.5)
                ? Icon(
                    Icons.star_half,
                    size: iconSize,
                  )
                : Icon(
                    Icons.star_border,
                    size: iconSize,
                  ),
        (_rating >= 4)
            ? Icon(
                Icons.star,
                size: iconSize,
              )
            : (_rating >= 3.5)
                ? Icon(
                    Icons.star_half,
                    size: iconSize,
                  )
                : Icon(
                    Icons.star_border,
                    size: iconSize,
                  ),
        (_rating >= 5)
            ? Icon(
                Icons.star,
                size: iconSize,
              )
            : (_rating >= 4.5)
                ? Icon(
                    Icons.star_half,
                    size: iconSize,
                  )
                : Icon(
                    Icons.star_border,
                    size: iconSize,
                  ),
      ],
    );
  }
}
