import 'package:realm/realm.dart';

part 'category.g.dart';

@RealmModel()
class _Category {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  String name = '';

  @MapTo('parent_id')
  @Indexed()
  ObjectId? parentId;

  @MapTo('note_count')
  int noteCount = 0;

  @MapTo('sub_categories')
  List<ObjectId> subCategories = [];

  bool verified = false;
  @MapTo('created_at')
  DateTime createdAt = DateTime.now();
  @MapTo('updated_at')
  DateTime updatedAt = DateTime.now();

  @MapTo('is_last')
  bool isLast = false;
}
