import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:super_notes/app/modules/note/controllers/note_controller.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class ReadingController extends GetxController {
  NoteController noteController = Get.find();
  
  final currentPage = 1.obs;
  final totalPage = 0.obs;
  var tcGotoPageNumber = TextEditingController();

  final Completer<PDFViewController> pdfViewController =
      Completer<PDFViewController>();



  @override
  void onClose() {}
}
