import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/note_req_controller.dart';

class NoteReqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteReqController>(
      () => NoteReqController(),
    );
  }
}
