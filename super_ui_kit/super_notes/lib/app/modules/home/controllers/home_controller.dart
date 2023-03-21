import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realm/realm.dart';
import 'package:super_notes/app/data/models/category.dart';
import 'package:super_notes/app/data/models/note.dart';
import 'package:super_notes/app/routes/app_pages.dart';
import 'package:super_notes/app/services/db_service.dart';

class HomeController extends GetxController {
  final _dbService = Get.find<DbService>();
  final selectedIndex = 0.obs;

  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: selectedIndex.value);
  }

  @override
  void onReady() {
    super.onReady();
    refreshAppData();
  }

  @override
  void onClose() {}

  Future<void> refreshAppData() async {}

  gotoNoteReq() {
     Get.toNamed(Routes.NOTE_REQ);
    //addNotes();
  }

  addCategories() {
    List<String> popularLanguages = [];

    var list = popularLanguages.map(
      (e) => Category(
        ObjectId(),
        name: e,
        parentId: ObjectId.fromHexString('641940f80e42d5334fdf6a75'),
        verified: true,
        updatedAt: DateTime.now(),
      ),
    );
    _dbService.realm!.write(() {
      _dbService.realm!.addAll(list!);
      var cat = _dbService.realm!
          .find<Category>(ObjectId.fromHexString('641940f80e42d5334fdf6a75'));
      cat?.subCategories.addAll(list.map((e) => e.id).toList());
    });
    printInfo(info: 'Saved ${list?.length} categories');
  }

  addNotes() {
    List<String> popularLanguages = [];

    var noteJson = {
      "title": "RW-Dart-Cheatsheet-1.0.2",
      "desc": "Dart 2 Cheat Sheet and Quick Reference",
      "src":
          "https://drive.google.com/uc?export=download&id=1eyWf-2ipZst9FjTRHlLSvHOhTQPW0apA",
      "authorName": "Codeco",
      "authorCredit": "reywenderlich.com",
      "coverAnim": "",
      "previews": [
        "https://drive.google.com/uc?export=download&id=1XP4P1QAQXIh516S0vlEF_fMLCT9tGsLe",
        "https://drive.google.com/uc?export=download&id=1uuYTcUlgsIg1MIKZF71_IZge_b9WVwi6"
      ],
      "categories": ["641942f0f2447496bb5bb5fa"],
    };

    var note = Note(
      ObjectId(),
      title: noteJson['title'] as String,
      desc: noteJson['desc'] as String,
      src: noteJson['src'] as String,
      authorName: noteJson['authorName'] as String,
      authorCredit: noteJson['authorCredit'] as String,
      coverAnim: noteJson['coverAnim'] as String,
      previews: noteJson['previews'] as List<String>,
      categories: (noteJson['categories'] as List<String>)
          .map((e) => ObjectId.fromHexString(e)),
      verified: true,
      updatedAt: DateTime.now(),
    );
    _dbService.realm!.write(() {
      _dbService.realm!.add(note);
    });
    printInfo(info: 'Note saved');
  }
}
