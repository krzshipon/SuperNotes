// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Category extends _Category
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Category(
    ObjectId id, {
    String name = '',
    ObjectId? parentId,
    int noteCount = 0,
    bool verified = false,
    required DateTime updatedAt,
    bool isLast = false,
    Iterable<ObjectId> subCategories = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Category>({
        'name': '',
        'note_count': 0,
        'verified': false,
        'created_at': DateTime.now(),
        'updated_at': DateTime.now(),
        'is_last': false,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'parent_id', parentId);
    RealmObjectBase.set(this, 'note_count', noteCount);
    RealmObjectBase.set(this, 'verified', verified);
    RealmObjectBase.set(this, 'created_at', createdAt);
    RealmObjectBase.set(this, 'updated_at', updatedAt);
    RealmObjectBase.set(this, 'is_last', isLast);
    RealmObjectBase.set<RealmList<ObjectId>>(
        this, 'sub_categories', RealmList<ObjectId>(subCategories));
  }

  Category._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  ObjectId? get parentId =>
      RealmObjectBase.get<ObjectId>(this, 'parent_id') as ObjectId?;
  @override
  set parentId(ObjectId? value) =>
      RealmObjectBase.set(this, 'parent_id', value);

  @override
  int get noteCount => RealmObjectBase.get<int>(this, 'note_count') as int;
  @override
  set noteCount(int value) => RealmObjectBase.set(this, 'note_count', value);

  @override
  RealmList<ObjectId> get subCategories =>
      RealmObjectBase.get<ObjectId>(this, 'sub_categories')
          as RealmList<ObjectId>;
  @override
  set subCategories(covariant RealmList<ObjectId> value) =>
      throw RealmUnsupportedSetError();

  @override
  bool get verified => RealmObjectBase.get<bool>(this, 'verified') as bool;
  @override
  set verified(bool value) => RealmObjectBase.set(this, 'verified', value);

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
  bool get isLast => RealmObjectBase.get<bool>(this, 'is_last') as bool;
  @override
  set isLast(bool value) => RealmObjectBase.set(this, 'is_last', value);

  @override
  Stream<RealmObjectChanges<Category>> get changes =>
      RealmObjectBase.getChanges<Category>(this);

  @override
  Category freeze() => RealmObjectBase.freezeObject<Category>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Category._);
    return const SchemaObject(ObjectType.realmObject, Category, 'Category', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('parentId', RealmPropertyType.objectid,
          mapTo: 'parent_id', optional: true, indexed: true),
      SchemaProperty('noteCount', RealmPropertyType.int, mapTo: 'note_count'),
      SchemaProperty('subCategories', RealmPropertyType.objectid,
          mapTo: 'sub_categories', collectionType: RealmCollectionType.list),
      SchemaProperty('verified', RealmPropertyType.bool),
      SchemaProperty('createdAt', RealmPropertyType.timestamp,
          mapTo: 'created_at'),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp,
          mapTo: 'updated_at'),
      SchemaProperty('isLast', RealmPropertyType.bool, mapTo: 'is_last'),
    ]);
  }
}
