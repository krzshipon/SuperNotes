import 'package:get/get.dart';
import 'package:super_notes/app/extentions/string_ext.dart';
import 'package:super_notes/app/modules/feedback/controllers/feedback_controller.dart';
import 'package:super_notes/app/modules/feedback/views/feedback_view.dart';
import 'package:super_notes/app/routes/app_pages.dart';
import 'package:super_notes/app/services/auth_service.dart';

class SettingController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  var currentLang = Get.locale?.languageCode.getLanguageFromCode().obs;

  void gotoProfile() {
    if (_authService.currentUser.value == null) {
      Get.toNamed(Routes.AUTH);
    } else {
      Get.toNamed(Routes.PROFILE);
    }
  }

  void gotoFavourites() {
    Get.toNamed(Routes.FAVOURITE);
  }

  void gotoLicense() {
    Get.toNamed(Routes.LICENSE);
  }

  void gotoLanguageSetting() {
    Get.toNamed(Routes.LANGUAGE);
  }

  openFeedbackView() {
    Get.lazyPut<FeedbackController>(
      () => FeedbackController(),
    );
    Get.bottomSheet(FeedbackView());
  }
}
