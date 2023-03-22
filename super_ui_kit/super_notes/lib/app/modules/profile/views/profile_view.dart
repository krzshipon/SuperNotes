import 'package:flutter/material.dart';
import 'package:super_notes/app/data/asset_keys.dart';

import 'package:super_notes/app/modules/profile/views/profile_item_view.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      floatingActionButton: Obx(() => CSIconButton(
            icon: (controller.editModeActive.value ||
                    controller.emailEditModeActive.value ||
                    controller.passEditModeActive.value)
                ? Icons.check_sharp
                : Icons.edit_sharp,
            ontap: () => controller.toogleEditMode(),
          )),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        children: [
          CSHeader(
            title: 'profile'.tr,
          ),
          verticalSpaceSmall,
          CSCard(
            childrens: [
              verticalSpaceSmall,
              (controller.user.value?.profile.pictureUrl == null)
                  ? Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        radius: 50,
                        foregroundColor: Get.theme.colorScheme.secondary,
                        backgroundColor: Get.theme.colorScheme.secondary,
                        backgroundImage:
                            const AssetImage(kProfileImage),
                      ),
                    )
                  : Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        radius: 50,
                        foregroundColor: Get.theme.colorScheme.secondary,
                        backgroundColor: Get.theme.colorScheme.secondary,
                        backgroundImage:
                            NetworkImage(controller.user.value!.profile.pictureUrl!),
                      ),
                    ),
              verticalSpaceTiny,
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (!controller.editModeActive.value)
                        ? CSText.title(
                            controller.user.value?.profile.firstName ?? 'setName'.tr)
                        : Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CSInputField(
                                maxLines: 1,
                                controller: controller.tcName,
                                placeholder: 'name'.tr,
                                inputType: TextInputType.name,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CSText.label(controller.user.value?.profile.email ?? 'setEmail'.tr),
                  ],
                ),
              ),
              verticalSpaceMedium,
              Row(
                children: const [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.download_sharp),
                    ),
                  ),
                  horizontalSpaceTiny,
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CSText.label('190+'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.upload_sharp),
                    ),
                  ),
                  horizontalSpaceTiny,
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CSText.label('20+'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.favorite_sharp),
                    ),
                  ),
                  horizontalSpaceTiny,
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CSText.label('190+'),
                    ),
                  ),
                ],
              ),
              verticalSpaceSmall
            ],
          ),
          verticalSpaceLarge,
          Obx(
            () => Expanded(
              child: ListView(
                children: [
                  (!controller.emailEditModeActive.value)
                      ? ProfileItemView(
                          iconData: Icons.email_sharp,
                          title: 'Change email',
                          ontap: () => controller.changeEmail(),
                        )
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: kmCardMarginS, right: kmCardMarginS),
                            child: CSInputField(
                              maxLines: 1,
                              controller: controller.tcEmail,
                              placeholder: 'email'.tr,
                              inputType: TextInputType.emailAddress,
                              errorText: controller.emailError.isTrue
                                  ? 'emailError'.tr
                                  : null,
                            ),
                          ),
                        ),
                  (!controller.passEditModeActive.value)
                      ? ProfileItemView(
                          iconData: Icons.password_sharp,
                          title: 'changePass'.tr,
                          ontap: () => controller.changePass(),
                        )
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: kmCardMarginS, right: kmCardMarginS),
                            child: CSInputField(
                              maxLines: 1,
                              controller: controller.tcPass,
                              placeholder: 'pass'.tr,
                              isPassword: true,
                              errorText: (controller.passwordError.value)
                                  ? 'passError'.tr
                                  : null,
                            ),
                          ),
                        ),
                  if (controller.passEditModeActive.value) verticalSpaceRegular,
                  if (controller.passEditModeActive.value)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: kmCardMarginS, right: kmCardMarginS),
                        child: CSInputField(
                          maxLines: 1,
                          controller: controller.tcPassConfirm,
                          placeholder: 'confirmPassword'.tr,
                          enabled: true,
                          isPassword: true,
                          errorText: (controller.confirmPasswordError.value)
                              ? 'confirmPassError'.tr
                              : null,
                        ),
                      ),
                    ),
                  ProfileItemView(
                    iconData: Icons.logout_sharp,
                    title: 'Logout',
                    ontap: (() => controller.logOut()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
