import 'package:flutter/material.dart';
import 'package:super_notes_admin/app/routes/app_pages.dart';
import 'package:super_notes_admin/app/services/auth_service.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class GlobalMiddleware extends GetMiddleware {
  final AuthService _authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    printInfo(info: "Redirect");
    var isLoggedIn = _authService.currentUser.value != null;
    return isLoggedIn == true ? null : const RouteSettings(name: Routes.AUTH);
  }
}
