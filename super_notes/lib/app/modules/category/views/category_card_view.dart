import 'package:flutter/cupertino.dart';

import 'package:super_notes/app/data/models/category.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class CategoryCardView extends GetView {
  final Category _category;
  final void Function()? ontap;

  const CategoryCardView(this._category, {super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return CSCard(
      onTap: ontap,
      children: [
        const Icon(CupertinoIcons.book_circle),
        verticalSpaceTiny,
        CSText.title(
          _category.name,
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        if (_category.noteCount > 0) verticalSpaceTiny,
        if (_category.noteCount > 0)
          CSText.label('${_category.noteCount}+ notes'),
      ],
    );
  }
}
