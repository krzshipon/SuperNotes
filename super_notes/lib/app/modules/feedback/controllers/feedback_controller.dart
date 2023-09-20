import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:super_notes/app/services/auth_service.dart';
import 'package:super_notes/app/services/db_service.dart';
import 'package:super_ui_kit/super_ui_kit.dart';
import 'package:super_notes/app/data/models/feedback.dart' as app_feedback;

class FeedbackController extends GetxController {
  final _dbService = Get.find<DbService>();
  final _authService = Get.find<AuthService>();

  final tcFeedback = TextEditingController();

  @override
  void onClose() {}

  Future<void> sendFeedback() async {
    var msg = tcFeedback.text;
    if (msg.isNotEmpty) {
      Get.showLoader();
      _dbService.realm?.write(
        () => _dbService.realm?.add<app_feedback.Feedback>(
          app_feedback.Feedback(
            ObjectId(),
            updatedAt: DateTime.now(),
            feedback: msg,
            userId: _authService.currentUser.value?.id,
          ),
        ),
      );
      Get.hideLoader();
      Get.back();
    } else {
      Get.back();
    }
  }
}
