import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/intro_controller.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroController>(
      () => IntroController(),
    );
  }
}
