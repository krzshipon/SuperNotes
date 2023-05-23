import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/review_controller.dart';

class ReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewController>(
      () => ReviewController(),
    );
  }
}
