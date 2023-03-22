import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class FeedbackController extends GetxController {
  final tcFeedback = TextEditingController();

  @override
  void onClose() {}

  Future<void> sendFeedback() async {
    var msg = tcFeedback.text;
    if (msg.isNotEmpty) {
    } else {
      Get.back();
    }
  }
}
