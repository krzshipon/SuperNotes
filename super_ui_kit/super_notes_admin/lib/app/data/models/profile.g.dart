// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Profile extends _Profile with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Profile(
    ObjectId id,
    String userId, {
    String name = '',
    String mobile = '',
    String email = '',
    String password = '',
    int likeCount = 0,
    int downloadCount = 0,
    int uploadCount = 0,
    String img = '',
    required DateTime updateDate,
    bool verified = false,
    bool emailVerified = false,
    bool mobileVerified = false,
    Iterable<String> favNotes = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Profile>({
        'name': '',
        'mobile': '',
        'email': '',
        'password': '',
        'like_count': 0,
        'download_count': 0,
        'upload_count': 0,
        'img': '',
        'create_date': DateTime.now(),
        'update_date': DateTime.now(),
        'verified': false,
        'email_verified': false,
        'mobile_verified': false,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'user_id', userId);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'mobile', mobile);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'password', password);
    RealmObjectBase.set(this, 'like_count', likeCount);
    RealmObjectBase.set(this, 'download_count', downloadCount);
    RealmObjectBase.set(this, 'upload_count', uploadCount);
    RealmObjectBase.set(this, 'img', img);
    RealmObjectBase.set(this, 'create_date', createDate);
    RealmObjectBase.set(this, 'update_date', updateDate);
    RealmObjectBase.set(this, 'verified', verified);
    RealmObjectBase.set(this, 'email_verified', emailVerified);
    RealmObjectBase.set(this, 'mobile_verified', mobileVerified);
    RealmObjectBase.set<RealmList<String>>(
        this, 'fav_notes', RealmList<String>(favNotes));
  }

  Profile._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get userId => RealmObjectBase.get<String>(this, 'user_id') as String;
  @override
  set userId(String value) => RealmObjectBase.set(this, 'user_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get mobile => RealmObjectBase.get<String>(this, 'mobile') as String;
  @override
  set mobile(String value) => RealmObjectBase.set(this, 'mobile', value);

  @override
  String get email => RealmObjectBase.get<String>(this, 'email') as String;
  @override
  set email(String value) => RealmObjectBase.set(this, 'email', value);

  @override
  String get password =>
      RealmObjectBase.get<String>(this, 'password') as String;
  @override
  set password(String value) => RealmObjectBase.set(this, 'password', value);

  @override
  int get likeCount => RealmObjectBase.get<int>(this, 'like_count') as int;
  @override
  set likeCount(int value) => RealmObjectBase.set(this, 'like_count', value);

  @override
  int get downloadCount =>
      RealmObjectBase.get<int>(this, 'download_count') as int;
  @override
  set downloadCount(int value) =>
      RealmObjectBase.set(this, 'download_count', value);

  @override
  int get uploadCount => RealmObjectBase.get<int>(this, 'upload_count') as int;
  @override
  set uploadCount(int value) =>
      RealmObjectBase.set(this, 'upload_count', value);

  @override
  String get img => RealmObjectBase.get<String>(this, 'img') as String;
  @override
  set img(String value) => RealmObjectBase.set(this, 'img', value);

  @override
  RealmList<String> get favNotes =>
      RealmObjectBase.get<String>(this, 'fav_notes') as RealmList<String>;
  @override
  set favNotes(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  DateTime get createDate =>
      RealmObjectBase.get<DateTime>(this, 'create_date') as DateTime;
  @override
  set createDate(DateTime value) =>
      RealmObjectBase.set(this, 'create_date', value);

  @override
  DateTime get updateDate =>
      RealmObjectBase.get<DateTime>(this, 'update_date') as DateTime;
  @override
  set updateDate(DateTime value) =>
      RealmObjectBase.set(this, 'update_date', value);

  @override
  bool get verified => RealmObjectBase.get<bool>(this, 'verified') as bool;
  @override
  set verified(bool value) => RealmObjectBase.set(this, 'verified', value);

  @override
  bool get emailVerified =>
      RealmObjectBase.get<bool>(this, 'email_verified') as bool;
  @override
  set emailVerified(bool value) =>
      RealmObjectBase.set(this, 'email_verified', value);

  @override
  bool get mobileVerified =>
      RealmObjectBase.get<bool>(this, 'mobile_verified') as bool;
  @override
  set mobileVerified(bool value) =>
      RealmObjectBase.set(this, 'mobile_verified', value);

  @override
  Stream<RealmObjectChanges<Profile>> get changes =>
      RealmObjectBase.getChanges<Profile>(this);

  @override
  Profile freeze() => RealmObjectBase.freezeObject<Profile>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Profile._);
    return const SchemaObject(ObjectType.realmObject, Profile, 'Profile', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('userId', RealmPropertyType.string, mapTo: 'user_id'),
      SchemaProperty('name', RealmPropertyType.string, indexed: true),
      SchemaProperty('mobile', RealmPropertyType.string, indexed: true),
      SchemaProperty('email', RealmPropertyType.string, indexed: true),
      SchemaProperty('password', RealmPropertyType.string),
      SchemaProperty('likeCount', RealmPropertyType.int, mapTo: 'like_count'),
      SchemaProperty('downloadCount', RealmPropertyType.int,
          mapTo: 'download_count'),
      SchemaProperty('uploadCount', RealmPropertyType.int,
          mapTo: 'upload_count'),
      SchemaProperty('img', RealmPropertyType.string),
      SchemaProperty('favNotes', RealmPropertyType.string,
          mapTo: 'fav_notes', collectionType: RealmCollectionType.list),
      SchemaProperty('createDate', RealmPropertyType.timestamp,
          mapTo: 'create_date'),
      SchemaProperty('updateDate', RealmPropertyType.timestamp,
          mapTo: 'update_date'),
      SchemaProperty('verified', RealmPropertyType.bool, indexed: true),
      SchemaProperty('emailVerified', RealmPropertyType.bool,
          mapTo: 'email_verified'),
      SchemaProperty('mobileVerified', RealmPropertyType.bool,
          mapTo: 'mobile_verified'),
    ]);
  }
}
