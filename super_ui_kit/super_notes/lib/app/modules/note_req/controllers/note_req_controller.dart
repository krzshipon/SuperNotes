import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:realm/realm.dart';
import 'package:super_notes/app/data/models/note_req.dart';
import 'package:super_notes/app/routes/app_pages.dart';
import 'package:super_notes/app/services/auth_service.dart';
import 'package:super_notes/app/services/db_service.dart';
import 'package:super_notes/app/util/app_constants.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class NoteReqController extends GetxController {
  final _dbService = Get.find<DbService>();
  final _authService = Get.find<AuthService>();
  GetStorage box = GetStorage();

  TextEditingController tcDesc = TextEditingController();

  final error = "".obs;
  final requests = <NoteReq>[].obs;

  @override
  void onInit() {
    super.onInit();
    requests.bindStream(getNoteReq());
  }

  @override
  void onReady() {
    super.onReady();
    tcDesc.addListener(() {
      error.value = tcDesc.text.isEmpty ? "Please write the description" : "";
    });
  }

  void submitReq() {
    var text = tcDesc.text;
    if (text.isNotEmpty) {
      _dbService.realm?.write(
        () {
          var addedReq = _dbService.realm?.add<NoteReq>(
            NoteReq(
              ObjectId(),
              status: NoteReqStatus.PENDING.name,
              updatedAt: DateTime.now(),
              desc: text,
              userId: _authService.currentUser.value?.id,
            ),
          );
          if (addedReq == null) {
            Get.showErrorDialog('Error! Please try again');
          } else {
            Get.showDialog("Requst success!", dialogType: DialogType.success);
          }
        },
      );
    }
  }

  Stream<List<NoteReq>> getNoteReq() {
    var query = 'user_id == \$0 SORT(updatedAt DESC)';
    final stream = _dbService.realm!
        .query<NoteReq>(query, [_authService.currentUser.value?.id]).changes;
    return stream.map((event) => event.results.toList());
  }

  openNote(NoteReq request) {
    if (request.noteId != null) {
      box.writeInMemory(kCurrentSelectedNoteKey, request.noteId);
      Get.toNamed(Routes.NOTE);
    } else {
      Get.showDialog('Your note will be uploaded soon!');
    }
  }
}
