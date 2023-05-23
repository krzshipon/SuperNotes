import 'package:get_storage/get_storage.dart';
import 'package:super_notes/app/data/models/category.dart';
import 'package:super_notes/app/routes/app_pages.dart';
import 'package:super_notes/app/services/db_service.dart';
import 'package:super_notes/app/util/app_constants.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class DashboardController extends GetxController {
  final _dbService = Get.find<DbService>();

  GetStorage box = GetStorage();

  final categories = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    categories.bindStream(getCategories());
  }

  @override
  void onClose() {}

  gotoSectionView(Category category) {
    box.writeInMemory(kCurrentSelectedCategoryIdKey, category.id);
    Get.toNamed(Routes.CATEGORY);
  }

  Stream<List<Category>> getCategories() {
    const categoriesQuery =
        'parentId == null AND verified == true SORT(name ASC)';
    final categoryStream =
        _dbService.realm!.query<Category>(categoriesQuery).changes;
    return categoryStream.map((event) => event.results.toList());
  }
}
