import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../shared/app_ui_helpers.dart';
import '../widgets/app_text.dart';

enum DialogType { success, error, alert, general }

const kDialogSucessAnim = 'assets/animations/anim_dialog_success.json';
const kDialogErrorAnim = 'assets/animations/anim_dialog_error.json';
const kDialogAlertAnim = 'assets/animations/anim_dialog_alert.json';
const kDialogGeneralAnim = 'assets/animations/anim_dialog_info.json';
const kSnackbarSecondsDuration = 2;

extension AppDialog on GetInterface {
  void showLoader() {
    Get.dialog(LottieBuilder.asset('assets/animations/loader.json'));
  }

  void hideLoader() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  void showAppSnackbar(String msg) {
    Get.showSnackbar(GetSnackBar(
      message: msg,
      duration: const Duration(seconds: kSnackbarSecondsDuration),
      snackPosition: SnackPosition.TOP,
    ));
  }

  void showDialog(
    String bodyText, {
    String title = '',
    void Function()? onConfirm,
    void Function()? onCancel,
    DialogType dialogType = DialogType.general,
  }) {
    Get.defaultDialog(
        backgroundColor: Get.theme.colorScheme.background,
        title: title,
        middleText: bodyText,
        onConfirm: onConfirm,
        onCancel: onCancel,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              (dialogType == DialogType.success)
                  ? kDialogSucessAnim
                  : (dialogType == DialogType.error)
                      ? kDialogErrorAnim
                      : (dialogType == DialogType.alert)
                          ? kDialogAlertAnim
                          : kDialogGeneralAnim,
              width: (dialogType == DialogType.success) ? 40 : 35,
              height: (dialogType == DialogType.success) ? 40 : 35,
              repeat: true,
            ),
            CSText(
              bodyText,
              color: Get.theme.colorScheme.secondary,
              textAlign: TextAlign.center,
            ),
            verticalSpaceRegular
          ],
        ),
        titleStyle: TextStyle(color: Get.theme.colorScheme.primary),
        middleTextStyle: TextStyle(color: Get.theme.colorScheme.secondary),
        confirmTextColor: Colors.white,
        cancelTextColor: Get.theme.colorScheme.primary,
        buttonColor: Get.theme.colorScheme.primary);
  }

  void showErrorDialog(
    String e, {
    void Function()? onConfirm,
    void Function()? onCancel,
  }) {
    showDialog(
      e,
      title: "failed".tr,
      onConfirm: onConfirm ?? () => Get.back(),
      onCancel: onCancel,
      dialogType: DialogType.error,
    );
  }
}
