import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/license_controller.dart';

class LicenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LicenseController>(
      () => LicenseController(),
    );
  }
}
