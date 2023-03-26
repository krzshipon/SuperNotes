import 'package:get_storage/get_storage.dart';
import 'package:realm/realm.dart';
import 'package:super_notes/app/data/data_keys.dart';
import 'package:super_notes/app/data/models/note.dart';
import 'package:super_notes/app/routes/app_pages.dart';
import 'package:super_notes/app/services/auth_service.dart';
import 'package:super_notes/app/services/db_service.dart';
import 'package:super_notes/app/util/app_constants.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class FavouriteController extends GetxController {
  final _dbService = Get.find<DbService>();
  final _authService = Get.find<AuthService>();

  GetStorage box = GetStorage();

  final notes = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    box = GetStorage();
    // notes.bindStream(getNotes());
    geFavNotes();
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

  void geFavNotes() {
    var data = _authService.currentUser.value?.customData;
    if (data != null) {
      if (data[kUserFavouriteList] is List<dynamic>) {
        var list = data[kUserFavouriteList] as List<dynamic>;
        printInfo(info: "Favourite notes count: ${list.length}");
        for (var element in list) {
          printInfo(info: "Favourite note id: $element");
          var note =
              _dbService.realm?.find<Note>(ObjectId.fromHexString(element));
          if (note != null) {
            notes.add(note);
          }
        }
      }
    }
  }

  // Stream<List<Note>> getNotes() {
  //   var categoriesQuery = 'isFav == true AND verified == true SORT(updatedAt ASC)';
  //   final categoryStream =
  //       _dbService.realm!.query<Note>(categoriesQuery).changes;
  //   return categoryStream.map((event) => event.results.toList());
  // }
}
