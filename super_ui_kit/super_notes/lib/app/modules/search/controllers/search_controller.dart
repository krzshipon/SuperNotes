import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_notes/app/data/models/note.dart';

import 'package:super_notes/app/routes/app_pages.dart';
import 'package:super_notes/app/services/db_service.dart';
import 'package:super_notes/app/util/app_constants.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class SearchController extends GetxController {
  final _dbService = Get.find<DbService>();
  GetStorage box = GetStorage();

  final tcSearch = TextEditingController();
  final notes = <Note>[].obs;
  final searchKeyword = ''.obs;

  @override
  void onReady() {
    super.onReady();
    tcSearch.addListener(() {
      notes.bindStream(getSearchedNotes(tcSearch.text));
    });

    searchRelatedNote('');
  }

  @override
  void onClose() {
    tcSearch.dispose();
  }

  searchRelatedNote(String value) {
    Get.showLoader();
    // printInfo(info: "Searched text: $value");
    try {
      var noteList = <Note>[];
      notes.value = noteList;
      // printInfo(info: 'Notes found: ${noteList.length}');
      Get.hideLoader();
    } catch (e) {
      Get.hideLoader;
      printError(info: e.toString());
    }
  }

  gotoNoteView(Note note) {
    box.writeInMemory(kCurrentSelectedNoteKey, note.id.hexString);
    Get.toNamed(Routes.NOTE);
  }

  Stream<List<Note>> getSearchedNotes(String text) {
    var searchQuery = 'verified == true AND (title CONTAINS[c] \$0 OR desc CONTAINS[c] \$0 OR authorName CONTAINS[c] \$0)';
    final noteStream =
        _dbService.realm!.query<Note>(searchQuery, [text]).changes;
    return noteStream.map((event) => event.results.toList());
  }
}
