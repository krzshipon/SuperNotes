// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_req.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class NoteReq extends _NoteReq with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  NoteReq(
    ObjectId id, {
    String? userId,
    String desc = '',
    String? noteId,
    required String status,
    String? msg,
    required DateTime updatedAt,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<NoteReq>({
        'desc': '',
        'status': NoteReqStatus.PENDING.name,
        'created_at': DateTime.now(),
        'updated_at': DateTime.now(),
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'user_id', userId);
    RealmObjectBase.set(this, 'desc', desc);
    RealmObjectBase.set(this, 'note_id', noteId);
    RealmObjectBase.set(this, 'status', status);
    RealmObjectBase.set(this, 'msg', msg);
    RealmObjectBase.set(this, 'created_at', createdAt);
    RealmObjectBase.set(this, 'updated_at', updatedAt);
  }

  NoteReq._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String? get userId => RealmObjectBase.get<String>(this, 'user_id') as String?;
  @override
  set userId(String? value) => RealmObjectBase.set(this, 'user_id', value);

  @override
  String get desc => RealmObjectBase.get<String>(this, 'desc') as String;
  @override
  set desc(String value) => RealmObjectBase.set(this, 'desc', value);

  @override
  String? get noteId => RealmObjectBase.get<String>(this, 'note_id') as String?;
  @override
  set noteId(String? value) => RealmObjectBase.set(this, 'note_id', value);

  @override
  String get status => RealmObjectBase.get<String>(this, 'status') as String;
  @override
  set status(String value) => RealmObjectBase.set(this, 'status', value);

  @override
  String? get msg => RealmObjectBase.get<String>(this, 'msg') as String?;
  @override
  set msg(String? value) => RealmObjectBase.set(this, 'msg', value);

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'created_at') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'created_at', value);

  @override
  DateTime get updatedAt =>
      RealmObjectBase.get<DateTime>(this, 'updated_at') as DateTime;
  @override
  set updatedAt(DateTime value) =>
      RealmObjectBase.set(this, 'updated_at', value);

  @override
  Stream<RealmObjectChanges<NoteReq>> get changes =>
      RealmObjectBase.getChanges<NoteReq>(this);

  @override
  NoteReq freeze() => RealmObjectBase.freezeObject<NoteReq>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(NoteReq._);
    return const SchemaObject(ObjectType.realmObject, NoteReq, 'NoteReq', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('userId', RealmPropertyType.string,
          mapTo: 'user_id', optional: true),
      SchemaProperty('desc', RealmPropertyType.string),
      SchemaProperty('noteId', RealmPropertyType.string,
          mapTo: 'note_id', optional: true),
      SchemaProperty('status', RealmPropertyType.string),
      SchemaProperty('msg', RealmPropertyType.string, optional: true),
      SchemaProperty('createdAt', RealmPropertyType.timestamp,
          mapTo: 'created_at'),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp,
          mapTo: 'updated_at'),
    ]);
  }
}
