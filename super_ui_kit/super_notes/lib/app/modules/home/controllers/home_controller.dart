import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realm/realm.dart';
import 'package:super_notes/app/data/models/category.dart';
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
    // Get.toNamed(Routes.NOTE_REQ);
    _dbService.realm!.write(
      () => _dbService.realm!.add<Category>(
        Category(ObjectId(),
            updatedAt: DateTime.now(), name: 'University', verified: true),
      ),
    );
  }
}
