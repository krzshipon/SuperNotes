import 'package:get/get.dart';

import '../controllers/license_controller.dart';

class LicenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LicenseController>(
      () => LicenseController(),
    );
  }
}
