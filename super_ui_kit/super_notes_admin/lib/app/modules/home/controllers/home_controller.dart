import 'package:sidebarx/sidebarx.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs;
  final sidebarXController =
      SidebarXController(selectedIndex: 0, extended: true);

  @override
  void onInit() {
    super.onInit();
    sidebarXController.addListener(() {
      currentIndex.value = sidebarXController.selectedIndex;
    });
  }
}
