import 'package:flutter/material.dart';
import 'package:super_notes_admin/app/routes/app_pages.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class GlobalMiddleware extends GetMiddleware {
  // final authController = Get.find<AuthController>();

  @override
  RouteSettings? redirect(String? route) {
    printInfo(info: "Redirect");
    var isLoggedIn = false;
    return isLoggedIn == true ? null : RouteSettings(name: Routes.AUTH);
  }
}
