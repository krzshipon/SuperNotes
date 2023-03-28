import 'dart:async';

import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:super_notes/app/data/models/note_req.dart';
import 'package:super_notes/app/data/models/profile.dart';
import 'package:super_notes/app/services/auth_service.dart';
import 'package:super_notes/app/services/db_service.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class ProfileController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final DbService _dbService = Get.find<DbService>();

  var user = Rxn<User?>();
  var profile = Rxn<Profile?>();
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
  final tcOldPass = TextEditingController();
  final tcNewPass = TextEditingController();

  @override
  void onClose() {
    tcEmail.dispose();
    tcName.dispose();
    tcOldPass.dispose();
    tcNewPass.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    user = _authService.currentUser;
    if (user.value != null) {
      getProfile(user.value!.id);
    }
  }

  @override
  void onReady() {
    super.onReady();
    tcName.text = profile.value?.name ?? "";
    tcEmail.text = user.value?.profile.email ?? "";

    tcOldPass.addListener(() {
      if (tcOldPass.text.isEmpty) {
        passwordError.value = false;
      } else {
        passwordError.value = (tcOldPass.text.length < 8) ? true : false;
      }
    });

    tcNewPass.addListener(() {
      if (tcNewPass.text.isEmpty) {
        passwordError.value = false;
      } else {
        passwordError.value = (tcNewPass.text.length < 8) ? true : false;
      }
    });

    tcEmail.addListener(() {
      emailError.value = (tcEmail.text.isEmpty) ? true : false;
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
        _dbService.realm?.write(() => profile.value?.name = tcName.text);
        editModeActive.value = false;
        Get.hideLoader();
      } catch (e) {
        editModeActive.value = false;
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
    if (tcOldPass.text.isNotEmpty) {
      printInfo(info: 'Updating user password');
      if (passwordError.isTrue) {
        Get.showErrorDialog(
          'passError'.tr,
        );
        return;
      }
      if (passwordError.isTrue) {
        Get.showErrorDialog(
          'confirmPassError'.tr,
        );
        return;
      }
      //_authService.changePassWord(tcOldPass.text, tcNewPass.text);
    } else {
      passEditModeActive.value = false;
    }
  }

  void getProfile(String id) {
    printInfo(info: 'getProfile()>>> user_id: $id');
    var query = 'user_id == \$0';
    var profileResult =
        _dbService.realm?.query<Profile>(query, [user.value!.id]);
    if (profileResult != null && profileResult.isNotEmpty) {
      profile.value = profileResult.single;
    }
  }
}
