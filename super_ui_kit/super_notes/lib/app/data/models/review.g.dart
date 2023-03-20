// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class BasicUser extends _BasicUser
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  static var _defaultsSet = false;

  BasicUser(
    ObjectId userId, {
    String name = '',
    String img = '',
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<BasicUser>({
        'name': '',
        'img': '',
      });
    }
    RealmObjectBase.set(this, 'user_id', userId);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'img', img);
  }

  BasicUser._();

  @override
  ObjectId get userId =>
      RealmObjectBase.get<ObjectId>(this, 'user_id') as ObjectId;
  @override
  set userId(ObjectId value) => RealmObjectBase.set(this, 'user_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get img => RealmObjectBase.get<String>(this, 'img') as String;
  @override
  set img(String value) => RealmObjectBase.set(this, 'img', value);

  @override
  Stream<RealmObjectChanges<BasicUser>> get changes =>
      RealmObjectBase.getChanges<BasicUser>(this);

  @override
  BasicUser freeze() => RealmObjectBase.freezeObject<BasicUser>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(BasicUser._);
    return const SchemaObject(
        ObjectType.embeddedObject, BasicUser, 'BasicUser', [
      SchemaProperty('userId', RealmPropertyType.objectid, mapTo: 'user_id'),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('img', RealmPropertyType.string),
    ]);
  }
}

class Review extends $Review with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Review(
    ObjectId id, {
    ObjectId? noteId,
    BasicUser? user,
    String text = '',
    required DateTime updatedAt,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Review>({
        'text': '',
        'created_at': DateTime.now(),
        'updated_at': DateTime.now(),
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'note_id', noteId);
    RealmObjectBase.set(this, 'user', user);
    RealmObjectBase.set(this, 'text', text);
    RealmObjectBase.set(this, 'created_at', createdAt);
    RealmObjectBase.set(this, 'updated_at', updatedAt);
  }

  Review._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  ObjectId? get noteId =>
      RealmObjectBase.get<ObjectId>(this, 'note_id') as ObjectId?;
  @override
  set noteId(ObjectId? value) => RealmObjectBase.set(this, 'note_id', value);

  @override
  BasicUser? get user =>
      RealmObjectBase.get<BasicUser>(this, 'user') as BasicUser?;
  @override
  set user(covariant BasicUser? value) =>
      RealmObjectBase.set(this, 'user', value);

  @override
  String get text => RealmObjectBase.get<String>(this, 'text') as String;
  @override
  set text(String value) => RealmObjectBase.set(this, 'text', value);

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
  Stream<RealmObjectChanges<Review>> get changes =>
      RealmObjectBase.getChanges<Review>(this);

  @override
  Review freeze() => RealmObjectBase.freezeObject<Review>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Review._);
    return const SchemaObject(ObjectType.realmObject, Review, 'Review', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('noteId', RealmPropertyType.objectid,
          mapTo: 'note_id', optional: true),
      SchemaProperty('user', RealmPropertyType.object,
          optional: true, linkTarget: 'BasicUser'),
      SchemaProperty('text', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp,
          mapTo: 'created_at'),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp,
          mapTo: 'updated_at'),
    ]);
  }
}
