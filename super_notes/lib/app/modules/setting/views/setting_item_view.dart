import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class SettingItemView extends GetView {
  final cornerRadius = 10.0;

  final String? header;
  final IconData iconData;
  final String title;
  final Function()? ontap;
  final bool showTrailing;

  const SettingItemView(
      {super.key,
      required this.iconData,
      required this.title,
      this.header,
      this.ontap,
      this.showTrailing = true});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (header != null)
          Padding(
              padding: EdgeInsets.only(left: kmCardMarginS + cornerRadius),
              child: CSText.label(header!)),
        Row(children: [
          Expanded(
            child: CSCard(
              onTap: ontap,
              radius: cornerRadius,
              margin: (header != null)
                  ? const EdgeInsets.only(
                      top: 3,
                      left: kmCardMarginS,
                      right: kmCardMarginS,
                      bottom: kmCardMarginS)
                  : null,
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
                            iconData,
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
                          child: Text(title),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Icon(
                          (showTrailing) ? Icons.arrow_forward : null,
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
