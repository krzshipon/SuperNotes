import 'package:flutter/cupertino.dart';
import 'package:super_notes/app/data/models/category.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class DashCategoryCardView extends GetView {
  final Category _category;
  final void Function()? ontap;

  const DashCategoryCardView(this._category, {super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return CSCard(
      onTap: ontap,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(CupertinoIcons.book_circle),
        verticalSpaceTiny,
        CSText.title(_category.name, maxLines: 1, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,),
        if (_category.noteCount > 1) verticalSpaceTiny,
        if (_category.noteCount > 1) CSText.label('${_category.noteCount}+ notes'),
      ],
    );
  }
}
