import 'package:realm/realm.dart';

part 'feedback.g.dart';

@RealmModel()
class _Feedback {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  @MapTo('user_id')
  String? userId;
  String feedback = '';
  @MapTo('created_at')
  DateTime createdAt = DateTime.now();
  @MapTo('updated_at')
  DateTime updatedAt = DateTime.now();
}