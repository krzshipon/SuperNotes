import 'package:get/get.dart';

import '../controllers/note_add_controller.dart';

class NoteAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteAddController>(
      () => NoteAddController(),
    );
  }
}
