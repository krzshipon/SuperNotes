import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:realm/realm.dart';
import 'package:super_notes/app/data/models/category.dart';
import 'package:super_notes/app/data/models/note.dart';
import 'package:super_notes/app/services/db_service.dart';
import 'package:super_notes/app/util/app_constants.dart';

class CategoryController extends GetxController {
  final _dbService = Get.find<DbService>();

  var category = Category(ObjectId(), updatedAt: DateTime.now()).obs;
  var categories = <Category>[].obs;
  var notes = <Note>[].obs;
  List<ObjectId> categoryStack = [];

  GetStorage box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    var selectedCategoryId = box.read(kCurrentSelectedCategoryIdKey);
    getSelectedCategory(selectedCategoryId);
    categoryStack.add(selectedCategoryId);
  }

  @override
  void onClose() {}

  void onBackPress() {
    if (categoryStack.length < 2) {
      Get.back();
    } else {
      categoryStack.removeLast();
      var id = categoryStack.last;
      getSelectedCategory(id);
    }
  }

  void getSelectedCategory(selectedCategoryId) {
    var selectedCategory = _dbService.realm!.find<Category>(selectedCategoryId);
    if (selectedCategory != null) {
      category.value = selectedCategory;
      categories.bindStream(getCategories(selectedCategory.id));
      notes.bindStream(getNotes(selectedCategory.id));
    }
  }

  openCategory(Category category) {
    getSelectedCategory(category.id);
    categoryStack.add(category.id);
  }

  Stream<List<Category>> getCategories(ObjectId parentId) {
    var categoriesQuery = 'parentId == \$0 AND verified == true SORT(name ASC)';
    final categoryStream =
        _dbService.realm!.query<Category>(categoriesQuery, [parentId]).changes;
    return categoryStream.map((event) => event.results.toList());
  }

  Stream<List<Note>> getNotes(ObjectId categoryId) {
    var categoriesQuery =
        'ANY categories == \$0 AND verified == true SORT(updatedAt ASC)';
    final categoryStream =
        _dbService.realm!.query<Note>(categoriesQuery, [categoryId]).changes;
    return categoryStream.map((event) => event.results.toList());
  }

  openNote(Note note) {}
}
