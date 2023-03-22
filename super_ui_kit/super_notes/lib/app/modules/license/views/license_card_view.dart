import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class LicenseCardView extends GetView {
  final String license;

  const LicenseCardView(this.license, {super.key});

  @override
  Widget build(BuildContext context) {
    return CSCard(childrens: [
      IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Align(
                    alignment: Alignment.center,
                    child: CSText.label(license),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
