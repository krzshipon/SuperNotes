import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:realm/realm.dart';
import 'package:super_notes/app/data/models/note.dart';
import 'package:super_notes/app/routes/app_pages.dart';
import 'package:super_notes/app/services/db_service.dart';
import 'package:super_notes/app/util/app_constants.dart';

class NoteController extends GetxController {
  final _dbService = Get.find<DbService>();

  final note = Note(ObjectId(), updatedAt: DateTime.now()).obs;
  final isFav = false.obs;

  GetStorage box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    var noteId = box.read(kCurrentSelectedNoteKey);
    if (noteId != null) {
      getNote(ObjectId.fromHexString(noteId));
    }
  }

  @override
  void onClose() {}

  void getNote(noteId) {
    final noteInDb = _dbService.realm!.find<Note>(noteId);
    if (noteInDb != null) {
      note.value = noteInDb;
    }
  }

  gotoReadNote() {
    Get.toNamed(Routes.READING);
  }

  void updateLikeStatus() {}

  void updateNote(bool isFav) {}
}
