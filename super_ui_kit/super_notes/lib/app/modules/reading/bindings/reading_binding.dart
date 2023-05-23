import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/reading_controller.dart';

class ReadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReadingController>(
      () => ReadingController(),
    );
  }
}
