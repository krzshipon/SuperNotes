import 'dart:async';

import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:super_notes/app/services/auth_service.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class ProfileController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  var user = Rxn<User?>();
  var editModeActive = false.obs;
  var emailEditModeActive = false.obs;
  var passEditModeActive = false.obs;
  var nameUpdated = false.obs;
  var emailUpdated = false.obs;
  final passwordError = false.obs;
  final confirmPasswordError = false.obs;
  final emailError = false.obs;

  final tcName = TextEditingController();
  final tcEmail = TextEditingController();
  final tcPass = TextEditingController();
  final tcPassConfirm = TextEditingController();
  late StreamSubscription<User?> userChangeListener;

  @override
  void onClose() {
    tcEmail.dispose();
    tcName.dispose();
    tcPass.dispose();
    tcPassConfirm.dispose();
    userChangeListener.cancel();
  }

  @override
  void onInit() {
    super.onInit();
    userChangeListener = _authService.currentUser.listen((user) {
      printInfo(info: 'User Changesd: $user');
      if (user != null) {
        this.user.value = user;
        if (emailEditModeActive.isTrue) {
          updateEmail();
        } else if (passEditModeActive.isTrue) {
          updatePass();
        }
      }
    }, cancelOnError: true);
  }

  @override
  void onReady() {
    super.onReady();
    tcName.text =
        "${user.value?.profile.firstName}  ${user.value?.profile.lastName}";
    tcEmail.text = '${user.value?.profile.email}';

    tcPass.addListener(() {
      if (tcPass.text.isEmpty) {
        passwordError.value = false;
      } else {
        passwordError.value = (tcPass.text.length < 8) ? true : false;
      }

      confirmPasswordError.value =
          (tcPassConfirm.text.isEmpty || tcPassConfirm.text == tcPass.text)
              ? false
              : true;
    });

    tcPassConfirm.addListener(() {
      confirmPasswordError.value =
          (tcPassConfirm.text.isEmpty || tcPassConfirm.text == tcPass.text)
              ? false
              : true;
    });

    tcEmail.addListener(() {
      emailError.value = !tcEmail.text.isEmail;
    });
  }

  void toogleEditMode() {
    if (emailEditModeActive.isTrue) {
      updateEmail();
    } else if (passEditModeActive.isTrue) {
      updatePass();
    } else {
      if (editModeActive.isTrue) {
        updateProfile();
      } else {
        editModeActive.value = true;
      }
    }
  }

  logOut() {
    Get.showLoader();
    _authService.logOutUser().then((value) {
      Get.hideLoader();
      Get.back();
      Get.showDialog(
        'loggedOut'.tr,
        onConfirm: () {
          Get.back();
        },
      );
    });
  }

  Future<void> updateProfile() async {
    if (tcName.text.isNotEmpty &&
        tcName.text !=
            "${user.value?.profile.firstName}  ${user.value?.profile.lastName}") {
      printInfo(info: 'Updating user name');
      try {
        Get.showLoader();
        // await _authService.currentUser
        //     ?.updateDisplayName(tcName.text)
        //     .then((value) {
        //   editModeActive.value = false;
        //   Get.hideLoader();
        //   Get.showDialog(
        //     "profileUpdated".tr,
        //     title: "success".tr,
        //     onConfirm: () => Get.back(),
        //     dialogType: DialogType.success,
        //   );
        // });
      } catch (e) {
        Get.hideLoader();
        printError(info: 'Failed with error: $e');
        Get.showErrorDialog(e.toString());
      }
    } else {
      editModeActive.value = false;
    }
  }

  Future<void> changeEmail() async {
    editModeActive.value = false;
    passEditModeActive.value = false;
    emailEditModeActive.value = true;
  }

  Future<void> updateEmail() async {
    if (tcEmail.text.isNotEmpty && tcEmail.text != user.value?.profile.email) {
      printInfo(info: 'Updating user email');
      if (emailError.isTrue) {
        Get.showErrorDialog(
          'emailError'.tr,
        );
        return;
      }
      // try {
      //   Get.showLoader();
      //   await FirebaseAuth.instance.currentUser
      //       ?.updateEmail(tcEmail.text)
      //       .then((value) {
      //     Get.hideLoader();
      //     emailEditModeActive.value = false;
      //     Get.showDialog('updateSuccess'.tr,
      //         onConfirm: () => Get.back(), dialogType: DialogType.success);
      //   });
      // } on FirebaseAuthException catch (e) {
      //   Get.hideLoader();
      //   printError(info: 'Failed with Firebase error: $e');
      //   if (e.code == 'requires-recent-login') {
      //     Get.showErrorDialog(
      //       'needLogin'.tr,
      //       onConfirm: () async {
      //         await FirebaseAuth.instance.signOut().then(
      //           (v) {
      //             Get.back();
      //             Get.toNamed(Routes.SIGNIN);
      //           },
      //         ).catchError((e) {
      //           Get.showErrorDialog(e.toString());
      //         });
      //       },
      //     );
      //   } else {
      //     Get.showErrorDialog(e.toString());
      //   }
      // } on Exception catch (e) {
      //   Get.hideLoader();
      //   printError(info: 'Failed with error: $e');
      //   Get.showErrorDialog(e.toString());
      // }
    } else {
      emailEditModeActive.value = false;
    }
  }

  Future<void> changePass() async {
    editModeActive.value = false;
    emailEditModeActive.value = false;
    passEditModeActive.value = true;
  }

  Future<void> updatePass() async {
    if (tcPass.text.isNotEmpty) {
      printInfo(info: 'Updating user password');
      if (passwordError.isTrue) {
        Get.showErrorDialog(
          'passError'.tr,
        );
        return;
      }
      if (tcPass.text != tcPassConfirm.text || confirmPasswordError.isTrue) {
        Get.showErrorDialog(
          'confirmPassError'.tr,
        );
        return;
      }

      // try {
      //   Get.showLoader();
      //   await FirebaseAuth.instance.currentUser
      //       ?.updatePassword(tcPass.text)
      //       .then((value) {
      //     Get.hideLoader();
      //     passEditModeActive.value = false;
      //     Get.showDialog('updateSuccess'.tr,
      //         onConfirm: () => Get.back(), dialogType: DialogType.success);
      //   });
      // } on FirebaseAuthException catch (e) {
      //   Get.hideLoader();
      //   printError(info: 'Failed with Firebase error: $e');
      //   if (e.code == 'requires-recent-login') {
      //     Get.showErrorDialog(
      //       'needLogin'.tr,
      //       onConfirm: () async {
      //         await FirebaseAuth.instance.signOut().then(
      //           (v) {
      //             Get.back();
      //             Get.toNamed(Routes.SIGNIN);
      //           },
      //         ).catchError((e) {
      //           Get.showErrorDialog(e.toString());
      //         });
      //       },
      //     );
      //   } else if (e.code == 'weak-password') {
      //     Get.showErrorDialog('weakPassword'.tr);
      //   } else {
      //     Get.showErrorDialog(e.toString());
      //   }
      // } on Exception catch (e) {
      //   Get.hideLoader();
      //   printError(info: 'Failed with error: $e');
      //   Get.showErrorDialog(e.toString());
      // }
    } else {
      passEditModeActive.value = false;
    }
  }
}
