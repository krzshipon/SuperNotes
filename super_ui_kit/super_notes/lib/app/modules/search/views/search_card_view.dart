import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:super_ui_kit/super_ui_kit.dart';

class SearchCardView extends GetView {
  final TextEditingController tc;
  final void Function()? ontap;
  final void Function(String value)? onSubmitted;

  const SearchCardView(
      {super.key, required this.tc, this.ontap, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return CSCard(
      cardType: CSCardType.item,
      padding: const EdgeInsets.all(kpSearchCardView),
      childrens: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: kpSearchCVLIconLeft),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.search,
                    color: Get.theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.only(left: kpSearchCVHintLeft),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      controller: tc,
                      textInputAction: TextInputAction.search,
                      cursorColor: Get.theme.colorScheme.primary,
                      onSubmitted: onSubmitted,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'searchNoteHint'.tr),
                    )),
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(
                CupertinoIcons.mic,
                color: Get.theme.colorScheme.primary,
              ),
            )
          ],
        ),
      ],
    );
  }
}
