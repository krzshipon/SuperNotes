import 'package:flutter/material.dart';
import 'package:super_notes_admin/app/modules/auth/views/auth_view.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 3),
        child: AuthView(),
      ),
    );
  }
}
