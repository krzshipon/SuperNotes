// ignore_for_file: library_private_types_in_public_api

import 'package:realm/realm.dart';

part 'review.g.dart';

@RealmModel(ObjectType.embeddedObject)
class _BasicUser {
  @MapTo('user_id')
  late ObjectId userId;
  String name = '';
  String img = '';
}

@RealmModel()
class $Review {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  @MapTo('note_id')
  ObjectId? noteId;
  double value = 0;
  late _BasicUser? user;
  String text = '';
  @MapTo('created_at')
  DateTime createdAt = DateTime.now();
  @MapTo('updated_at')
  DateTime updatedAt = DateTime.now();
}
