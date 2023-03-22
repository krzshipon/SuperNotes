import 'package:flutter/material.dart';

import 'package:super_notes/app/modules/setting/views/setting_item_view.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: kpHorizontalPadding),
        children: [
          verticalSpaceLarge,
          Padding(
            padding: const EdgeInsets.only(left: kmCardMarginS + kmTextExtraMargin),
            child: CSText.title('settings'.tr),
          ),
          verticalSpaceRegular,
          SettingItemView(
            ontap: () {
              controller.gotoProfile();
            },
            title: 'profile'.tr,
            iconData: Icons.account_circle_sharp,
          ),
          verticalSpaceMedium,
          SettingItemView(
            ontap: () {
              controller.gotoFavourites();
            },
            title: 'fvNotes'.tr,
            iconData: Icons.favorite_sharp,
          ),
          SettingItemView(
            ontap: () {
              controller.gotoLicense();
            },
            title: 'license'.tr,
            iconData: Icons.book_sharp,
          ),
          SettingItemView(
            ontap: () => controller.openFeedbackView(),
            title: 'feedback'.tr,
            iconData: Icons.feedback_sharp,
          ),
          verticalSpaceMedium,
          SettingItemView(
            ontap: () {
              controller.gotoLanguageSetting();
            },
            header: 'lang'.tr,
            title: controller.currentLang?.value?.name?? Get.locale?.languageCode ?? "English",
            iconData: Icons.language_sharp,
          ),
          verticalSpaceMedium,
          SettingItemView(
            header: 'version'.tr,
            title: '0.0.1',
            iconData: GetPlatform.isIOS? Icons.apple_sharp: Icons.android_sharp,
            showTrailing: false,
          ),
        ],
      ),
    );
  }
}
