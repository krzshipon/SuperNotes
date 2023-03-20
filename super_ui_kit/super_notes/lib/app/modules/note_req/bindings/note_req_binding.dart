import 'package:get/get.dart';

import '../controllers/note_req_controller.dart';

class NoteReqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteReqController>(
      () => NoteReqController(),
    );
  }
}
