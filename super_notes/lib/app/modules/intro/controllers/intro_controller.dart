import 'package:super_ui_kit/super_ui_kit.dart';

class IntroController extends GetxController {
  final count = 0.obs;
  void increment() => count.value++;
}
