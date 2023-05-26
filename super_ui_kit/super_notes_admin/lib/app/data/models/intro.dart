import 'package:realm/realm.dart';

part 'intro.g.dart';

@RealmModel()
class _Intro {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  String title = '';
  String desc = '';
  String src = '';

  @MapTo('created_at')
  DateTime createdAt = DateTime.now();
  @MapTo('updated_at')
  DateTime updatedAt = DateTime.now();
}
