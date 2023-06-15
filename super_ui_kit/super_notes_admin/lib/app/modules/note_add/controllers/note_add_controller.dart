import 'package:flutter/widgets.dart';
import 'package:realm/realm.dart';
import 'package:super_notes_admin/app/modules/note_add/views/category_dialog_view_view.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../../../data/models/category.dart';
import '../../../data/models/note.dart';
import '../../../services/db_service.dart';
import '../../../util/app_constants.dart';

class NoteAddController extends GetxController {
  final _dbService = Get.find<DbService>();
  GetStorage _box = GetStorage();

  final titleController = TextEditingController();
  final descController = TextEditingController();
  final srcController = TextEditingController();
  final authorController = TextEditingController();
  final authorCreditController = TextEditingController();
  final coverAnimController = TextEditingController();
  final prevController = TextEditingController();

  final RxList<List<Category>> categoriesList = RxList<List<Category>>([]);
  final selectedValues = <Category>[].obs;

  final categories = <Category>[].obs;

  final selectedCategories = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getCategories();
  }

  @override
  void onClose() {
    super.onClose();
  }

  addCategory() {
    Get.defaultDialog(
      content: CategoryDialogViewView(),
      onConfirm: () {
        selectedCategories.add(selectedValues.last);
        Get.back();
      },
    );
  }

  onCategoryChanged(index, Category? value) {
    printInfo(info: 'category changed>>> index:$index value:$value');
    if (value == null) return;
    selectedValues[index] = value;
    categoriesList.refresh;
    //categoriesList.add(categories);
    print(selectedValues.length);
    if (index + 1 < categoriesList.length) {
      categoriesList.removeRange(index + 1, categoriesList.length);
      selectedValues.removeRange(index + 1, selectedValues.length);
    }
    if (value.isLast) return;
    getSubCategories(index, value);
  }

  getCategories() {
    const categoriesQuery =
        'parentId == null AND verified == true SORT(name ASC)';
    final categoryResults =
        _dbService.realm!.query<Category>(categoriesQuery).toList();

    categories.value = categoryResults;
    if (categoryResults.isNotEmpty) {
      categoriesList.add(categoryResults);
      selectedValues.insert(0, categoryResults[0]);
    }
  }

  void getSubCategories(int index, Category category) {
    const categoriesQuery =
        'parentId == \$0 AND verified == true SORT(name ASC)';
    final categoryResults = _dbService.realm!
        .query<Category>(categoriesQuery, [category.id]).toList();
    if (categoryResults.isNotEmpty) {
      categoriesList.add(categoryResults);
      selectedValues.insert(index + 1, categoryResults[0]);
    }
  }

  deleteSelection(int index) {
    selectedCategories.removeAt(index);
    // selectedCategories
  }

  addNote() {
    var note = Note(
      ObjectId(),
      title: titleController.text,
      desc: descController.text,
      src: srcController.text,
      authorName: authorController.text,
      authorCredit: authorCreditController.text,
      coverAnim: coverAnimController.text,
      previews: prevController.text.split(','),
      categories: selectedCategories.map((element) => element.id).toList(),
      verified: true,
      updatedAt: DateTime.now(),
    );
    _dbService.realm!.write(() {
      _dbService.realm!.add(note);
    });
    Get.showDialog('Note Saved', dialogType: DialogType.success);
    printInfo(info: 'Note saved');
  }
}
