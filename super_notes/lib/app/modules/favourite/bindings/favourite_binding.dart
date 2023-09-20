import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/favourite_controller.dart';

class FavouriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavouriteController>(
      () => FavouriteController(),
    );
  }
}
