import 'package:flutter/widgets.dart';
import 'package:super_notes_admin/app/modules/note_add/views/category_dialog_view_view.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../../../data/models/category.dart';
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

  // addNotes() {
  //   var noteJson = {
  //     "title": "RW-Dart-Cheatsheet-1.0.2",
  //     "desc": "Dart 2 Cheat Sheet and Quick Reference",
  //     "src":
  //         "https://drive.google.com/uc?export=download&id=1eyWf-2ipZst9FjTRHlLSvHOhTQPW0apA",
  //     "authorName": "Codeco",
  //     "authorCredit": "reywenderlich.com",
  //     "coverAnim": "",
  //     "previews": [
  //       "https://drive.google.com/uc?export=download&id=1XP4P1QAQXIh516S0vlEF_fMLCT9tGsLe",
  //       "https://drive.google.com/uc?export=download&id=1uuYTcUlgsIg1MIKZF71_IZge_b9WVwi6"
  //     ],
  //     "categories": ["641942f0f2447496bb5bb5fa"],
  //   };

  //   var note = Note(
  //     ObjectId(),
  //     title: titleController.text,
  //     desc: descController.text,
  //     src: srcController.text,
  //     authorName: authorController.text,
  //     authorCredit: authorCreditController.text,
  //     coverAnim: coverAnimController.text,
  //     previews: prevController.text.split(','),
  //     categories: (selectedCategories.map((e) => ObjectId.fromHexString(e))),
  //     verified: true,
  //     updatedAt: DateTime.now(),
  //   );
  //   _dbService.realm!.write(() {
  //     _dbService.realm!.add(note);
  //   });
  //   Get.showDialog('Note Saved', dialogType: DialogType.success);
  //   printInfo(info: 'Note saved');
  // }

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
}
