import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:super_notes/app/data/models/category.dart';
import 'package:super_notes/app/routes/app_pages.dart';
import 'package:super_notes/app/services/db_service.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

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
      _dbService.realm!.addAll(list);
      var cat = _dbService.realm!
          .find<Category>(ObjectId.fromHexString('641940f80e42d5334fdf6a75'));
      cat?.subCategories.addAll(list.map((e) => e.id).toList());
    });
    printInfo(info: 'Saved ${list.length} categories');
  }
}
