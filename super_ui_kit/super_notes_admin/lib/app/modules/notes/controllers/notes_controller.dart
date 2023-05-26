import 'package:get/get.dart';

import '../../../data/models/note.dart';
import '../../../services/db_service.dart';

class NotesController extends GetxController {
  final _dbService = Get.find<DbService>();

  final notes = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    notes.bindStream(getNotes());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Stream<List<Note>> getNotes() {
    final noteStream = _dbService.realm!.all<Note>().changes;
    return noteStream.map((event) => event.results.toList());
  }
}
