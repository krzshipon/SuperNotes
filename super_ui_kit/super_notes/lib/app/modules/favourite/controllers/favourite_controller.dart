import 'package:get_storage/get_storage.dart';
import 'package:super_notes/app/data/models/note.dart';
import 'package:super_notes/app/routes/app_pages.dart';
import 'package:super_notes/app/services/db_service.dart';
import 'package:super_notes/app/util/app_constants.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class FavouriteController extends GetxController {
  final _dbService = Get.find<DbService>();

  GetStorage box = GetStorage();

  final notes = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    box = GetStorage();
    notes.bindStream(getNotes());
  }

  @override
  void onClose() {}

  gotoNoteView(String? noteId) {
    if (noteId != null && noteId.isNotEmpty) {
      box.writeInMemory(kCurrentSelectedNoteKey, noteId);
      Get.toNamed(Routes.NOTE);
    } else {
      Get.showErrorDialog('inavildNote'.tr);
    }
  }

  Stream<List<Note>> getNotes() {
    var categoriesQuery = 'verified == true SORT(updatedAt ASC)';
    final categoryStream =
        _dbService.realm!.query<Note>(categoriesQuery).changes;
    return categoryStream.map((event) => event.results.toList());
  }
}
