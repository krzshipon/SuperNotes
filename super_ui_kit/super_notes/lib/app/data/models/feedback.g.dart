// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Feedback extends _Feedback
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Feedback(
    ObjectId id, {
    String? userId,
    String feedback = '',
    required DateTime updatedAt,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Feedback>({
        'feedback': '',
        'created_at': DateTime.now(),
        'updated_at': DateTime.now(),
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'user_id', userId);
    RealmObjectBase.set(this, 'feedback', feedback);
    RealmObjectBase.set(this, 'created_at', createdAt);
    RealmObjectBase.set(this, 'updated_at', updatedAt);
  }

  Feedback._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String? get userId =>
      RealmObjectBase.get<ObjectId>(this, 'user_id') as String?;
  @override
  set userId(String? value) => RealmObjectBase.set(this, 'user_id', value);

  @override
  String get feedback =>
      RealmObjectBase.get<String>(this, 'feedback') as String;
  @override
  set feedback(String value) => RealmObjectBase.set(this, 'feedback', value);

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
  Stream<RealmObjectChanges<Feedback>> get changes =>
      RealmObjectBase.getChanges<Feedback>(this);

  @override
  Feedback freeze() => RealmObjectBase.freezeObject<Feedback>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Feedback._);
    return const SchemaObject(ObjectType.realmObject, Feedback, 'Feedback', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('userId', RealmPropertyType.string,
          mapTo: 'user_id', optional: true),
      SchemaProperty('feedback', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp,
          mapTo: 'created_at'),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp,
          mapTo: 'updated_at'),
    ]);
  }
}
