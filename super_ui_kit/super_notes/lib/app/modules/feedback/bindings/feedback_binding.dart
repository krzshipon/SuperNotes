import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/feedback_controller.dart';

class FeedbackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedbackController>(
      () => FeedbackController(),
    );
  }
}
