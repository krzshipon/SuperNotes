// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intro.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Intro extends _Intro with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Intro(
    ObjectId id, {
    String title = '',
    String desc = '',
    String src = '',
    required DateTime updatedAt,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Intro>({
        'title': '',
        'desc': '',
        'src': '',
        'created_at': DateTime.now(),
        'updated_at': DateTime.now(),
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'desc', desc);
    RealmObjectBase.set(this, 'src', src);
    RealmObjectBase.set(this, 'created_at', createdAt);
    RealmObjectBase.set(this, 'updated_at', updatedAt);
  }

  Intro._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get desc => RealmObjectBase.get<String>(this, 'desc') as String;
  @override
  set desc(String value) => RealmObjectBase.set(this, 'desc', value);

  @override
  String get src => RealmObjectBase.get<String>(this, 'src') as String;
  @override
  set src(String value) => RealmObjectBase.set(this, 'src', value);

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
  Stream<RealmObjectChanges<Intro>> get changes =>
      RealmObjectBase.getChanges<Intro>(this);

  @override
  Intro freeze() => RealmObjectBase.freezeObject<Intro>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Intro._);
    return const SchemaObject(ObjectType.realmObject, Intro, 'Intro', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('desc', RealmPropertyType.string),
      SchemaProperty('src', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp,
          mapTo: 'created_at'),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp,
          mapTo: 'updated_at'),
    ]);
  }
}
