import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_notes/app/data/models/language.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class LanguageItemView extends GetView {
  final cornerRadius = 10.0;

  final Language language;
  final Function()? ontap;

  const LanguageItemView(this.language, {super.key, this.ontap});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(children: [
          Expanded(
            child: CSCard(
              onTap: ontap,
              radius: cornerRadius,
              padding: EdgeInsets.symmetric(
                  vertical: kpCardPaddingS, horizontal: cornerRadius),
              cardType: CSCardType.item,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.language_sharp,
                            color: Get.theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(language.name ?? ""),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Icon(
                          (language.code == Get.locale?.languageCode)
                              ? CupertinoIcons.checkmark_alt
                              : null,
                          color: Get.theme.colorScheme.primary,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ]),
      ],
    );
  }
}
