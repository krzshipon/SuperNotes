import 'package:get_storage/get_storage.dart';
import 'package:realm/realm.dart';
import 'package:super_notes/app/data/data_keys.dart';
import 'package:super_notes/app/data/models/note.dart';
import 'package:super_notes/app/routes/app_pages.dart';
import 'package:super_notes/app/services/auth_service.dart';
import 'package:super_notes/app/services/db_service.dart';
import 'package:super_notes/app/util/app_constants.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class NoteController extends GetxController {
  final _authService = Get.find<AuthService>();
  final _dbService = Get.find<DbService>();

  final note = Note(ObjectId(), updatedAt: DateTime.now()).obs;

  GetStorage box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    var noteId = box.read(kCurrentSelectedNoteKey);
    if (noteId != null) {
      getNote(ObjectId.fromHexString(noteId));
    }
    var data = _authService.currentUser.value?.customData;
    if (data != null) {
      var list = data[kUserFavouriteList] as List<dynamic>;
      if (list.contains(noteId)) {
        note.value.isFav = true;
      } else {
        note.value.isFav = false;
      }
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

  Future<void> updateLikeStatus() async {
    Get.showLoader();
    var user = _authService.currentUser.value;
    List<dynamic> list = [];
    if (user != null) {
      var customData = user.customData;
      if (note.value.isFav) {
        if (customData != null) {
          list = customData[kUserFavouriteList] as List<dynamic>;
          list.remove(note.value.id.hexString);
        }
      } else {
        list = customData[kUserFavouriteList] as List<dynamic>;
        list.add(note.value.id.hexString);
      }
    }

    final updatedCustomUserData = {kUserFavouriteList: list};
    await user?.functions.call(kfWriteUserData, [updatedCustomUserData]);
    await _authService.refreshUserData().then((value) {
      note.value.isFav = !note.value.isFav;
      note.refresh();
    });
    Get.hideLoader();
  }

  void updateNote(bool isFav) {}
}
