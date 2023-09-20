// ignore_for_file: constant_identifier_names

import 'package:realm/realm.dart';

part 'note_req.g.dart';

enum NoteReqStatus{PENDING, DONE, INVALID} 

@RealmModel()
class _NoteReq {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  @MapTo('user_id')
  String? userId;
  String desc = '';
  @MapTo('note_id')
  String? noteId;
  String status = NoteReqStatus.PENDING.name;
  String? msg;
  @MapTo('created_at')
  DateTime createdAt = DateTime.now();
  @MapTo('updated_at')
  DateTime updatedAt = DateTime.now();
}