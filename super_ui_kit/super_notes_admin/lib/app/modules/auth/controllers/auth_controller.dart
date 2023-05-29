import 'dart:async';

import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:super_notes_admin/app/routes/app_pages.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../../../data/data_keys.dart';
import '../../../services/auth_service.dart';

class AuthController extends GetxController {
  final _authService = Get.find<AuthService>();

  final GetStorage box = GetStorage();
  TextEditingController tcUserName = TextEditingController();
  TextEditingController tcUserPass = TextEditingController();

  final hasEmailError = false.obs;
  final hasPassError = false.obs;
  final error = "".obs;

  @override
  void onInit() {
    super.onInit();
    tcUserName.addListener(() {
      box.write(kUserEmail, tcUserName.text);
      printInfo(info: tcUserName.text);
    });
    tcUserPass.addListener(() {
      box.write(kUserPass, tcUserPass.text);
    });
  }

  @override
  void onReady() {
    super.onReady();
    tcUserName.text = box.read(kUserEmail) ?? "";
    tcUserPass.text = box.read(kUserPass) ?? "";
    // if (_authService.currentUser.value != null) {
    //   Get.offNamed(Routes.HOME);
    // }
  }

  @override
  void onClose() {
    super.onClose();
  }

  authenticateUser() async {
    Get.showLoader();
    // Timer(const Duration(milliseconds: 1400), () {
    //   Get.hideLoader();
    //   printInfo(info: 'Username: ${tcUserName.text} pass: ${tcUserPass.text}');
    //   if (tcUserName.text == "01401303202" &&
    //       tcUserPass.text == "01401303202") {
    //     Get.showDialog("Login Success", dialogType: DialogType.success);
    //     Timer(
    //         const Duration(milliseconds: 1100), () => Get.toNamed(Routes.HOME));
    //   } else {
    //     Get.showDialog("Login Failed!", dialogType: DialogType.error);
    //   }
    // });
    hasEmailError.value = false;
    hasPassError.value = false;
    String userName = tcUserName.text;
    String userPass = tcUserPass.text;
    if (userName.isEmpty) {
      hasEmailError.value = true;
      Get.hideLoader();
    } else if (userPass.isEmpty) {
      hasPassError.value = true;
      Get.hideLoader();
    } else {
      var user = await _authService
          .logInUserEmailPw(userName, userPass)
          .catchError((e) {
        if (e is RealmError) {
          printError(info: 'Realm Error: $e');
        }
        error.value = "$e";
        printError(info: 'Auth Error: $e');
        Get.hideLoader();
      });
      printInfo(info: "User: $user");
      Get.hideLoader();
      Get.offAllNamed(Routes.HOME);
    }
  }
}
