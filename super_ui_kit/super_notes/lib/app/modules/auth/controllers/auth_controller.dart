import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:realm/realm.dart';
import 'package:super_notes/app/data/data_keys.dart';
import 'package:super_notes/app/extentions/string_ext.dart';
import 'package:super_notes/app/routes/app_pages.dart';
import 'package:super_notes/app/services/auth_service.dart';
import 'package:super_notes/app/util/app_constants.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

enum AuthType { login, signup }

class AuthController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final GetStorage box = GetStorage();

  TextEditingController tcUserName = TextEditingController();
  TextEditingController tcUserPass = TextEditingController();

  final authType = AuthType.signup.obs;
  final hasEmailError = false.obs;
  final hasPassError = false.obs;

  final error = "".obs;

  @override
  void onInit() {
    super.onInit();
    tcUserName.addListener(() {
      box.write(kUserEmail, tcUserName.text);
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
    authType.value = box.read(kUserLastAuthType) == kAuthTypeLogin
        ? AuthType.login
        : AuthType.signup;
    if (_authService.currentUser.value != null) {
      Get.offNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {}

  authenticateUser() async {
    Get.showLoader();
    hasEmailError.value = false;
    hasPassError.value = false;
    String userName = tcUserName.text;
    String userPass = tcUserPass.text;
    if (userName.isEmpty) {
      hasEmailError.value = true;
      Get.hideLoader();
    } else if (!userPass.isValidPassword) {
      hasPassError.value = true;
      Get.hideLoader();
    } else {
      if (authType.value == AuthType.login) {
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
        Get.offAllNamed(Routes.HOME);
      } else {
        var user = await _authService
            .registerUserEmailPw(userName, userPass)
            .catchError((e) {
          if (e is RealmError) {
            printError(info: 'Realm Error: $e');
          }
          error.value = "$e";
          printError(info: 'Auth Error: $e');
          Get.hideLoader();
        });
        printInfo(info: "User: $user");
        Get.offAllNamed(Routes.HOME);
      }
      Get.hideLoader();
    }
  }

  switchAuthType() {
    authType.value = authType.value == AuthType.login
        ? AuthType.signup
        : authType.value = AuthType.login;
    box.write(kUserLastAuthType,
        authType.value == AuthType.login ? kAuthTypeLogin : kAuthTypeSignup);
  }
}
