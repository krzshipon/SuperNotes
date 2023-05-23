import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/note_controller.dart';

class NoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteController>(
      () => NoteController(),
    );
  }
}
