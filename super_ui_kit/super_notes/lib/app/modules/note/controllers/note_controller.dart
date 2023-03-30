import 'package:get_storage/get_storage.dart';
import 'package:realm/realm.dart';
import 'package:super_notes/app/data/models/note.dart';
import 'package:super_notes/app/data/models/profile.dart';
import 'package:super_notes/app/routes/app_pages.dart';
import 'package:super_notes/app/services/auth_service.dart';
import 'package:super_notes/app/services/db_service.dart';
import 'package:super_notes/app/util/app_constants.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class NoteController extends GetxController {
  final _authService = Get.find<AuthService>();
  final _dbService = Get.find<DbService>();

  GetStorage box = GetStorage();

  final note = Note(ObjectId(), updatedAt: DateTime.now()).obs;
  final currentPreviewIdx = 0.obs;
  Profile? profile;

  @override
  void onInit() {
    super.onInit();
    var noteId = box.read(kCurrentSelectedNoteKey);
    if (noteId != null) {
      getNote(ObjectId.fromHexString(noteId));
    }

    var user = _authService.currentUser;
    if (user.value != null) {
      getProfile(user.value!.id);
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
    _dbService.realm?.write(() {
      if (note.value.isFav) {
        profile?.favNotes.remove(note.value.id.hexString);
      } else {
        profile?.favNotes.add(note.value.id.hexString);
      }
      note.value.isFav = !note.value.isFav;
      note.refresh();
    });
    Get.hideLoader();
  }

  void updateNote(bool isFav) {}

  bacwardPreview() {
    currentPreviewIdx.value =
        (currentPreviewIdx.value - 1) % note.value.previews.length;
  }

  forwardPreview() {
    currentPreviewIdx.value =
        (currentPreviewIdx.value + 1) % note.value.previews.length;
  }

  void getProfile(String id) {
    printInfo(info: 'getProfile()>>> user_id: $id');
    var query = 'user_id == \$0';
    var profileResult = _dbService.realm?.query<Profile>(query, [id]);
    if (profileResult != null && profileResult.isNotEmpty) {
      profile = profileResult.single;
      if (profile != null) {
        note.value.isFav = profile!.favNotes.contains(note.value.id.hexString);
      }
    }
  }

  addReview() {}
}
