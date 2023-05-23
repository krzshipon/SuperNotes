import 'package:super_notes/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:super_notes/app/modules/search/controllers/search_controller.dart';
import 'package:super_notes/app/modules/setting/controllers/setting_controller.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
    Get.lazyPut<SettingController>(
      () => SettingController(),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}
