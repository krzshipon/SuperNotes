import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../../../data/asset_keys.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          verticalSpaceLarge,
          verticalSpaceLarge,
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              kAppIcon,
              width: 100,
              height: 100,
            ),
          ),
          // const Align(
          //   alignment: Alignment.center,
          //   child: CSText.headline('auth_welcome'),
          // ),
          verticalSpaceMedium,
          Obx(
            () => CSInputField(
              controller: controller.tcUserName,
              placeholder: 'auth_email'.tr,
              errorText: controller.hasEmailError.value
                  ? 'auth_email_validation_error'.tr
                  : null,
            ),
          ),
          verticalSpaceRegular,
          Obx(
            () => CSInputField(
              controller: controller.tcUserPass,
              placeholder: 'auth_pass'.tr,
              isPassword: true,
              errorText: controller.hasPassError.value
                  ? 'auth_pass_validation_error'.tr
                  : controller.error.isNotEmpty
                      ? controller.error.value
                      : null,
            ),
          ),
          verticalSpaceMedium,
          CSButton(
            title: 'button_login'.tr,
            onTap: () => controller.authenticateUser(),
          ),
          verticalSpaceLarge,
        ],
      ),
    );
  }
}
