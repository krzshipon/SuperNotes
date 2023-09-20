// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Rating extends _Rating with RealmEntity, RealmObjectBase, EmbeddedObject {
  static var _defaultsSet = false;

  Rating({
    double rating = 0,
    int ratingCount = 0,
    int oneStarCount = 0,
    int twoStarCount = 0,
    int threeStarCount = 0,
    int fourStarCount = 0,
    int fiveStarCount = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Rating>({
        'rating': 0,
        'rating_count': 0,
        'one_star_count': 0,
        'two_star_count': 0,
        'three_star_count': 0,
        'four_star_count': 0,
        'five_star_count': 0,
      });
    }
    RealmObjectBase.set(this, 'rating', rating);
    RealmObjectBase.set(this, 'rating_count', ratingCount);
    RealmObjectBase.set(this, 'one_star_count', oneStarCount);
    RealmObjectBase.set(this, 'two_star_count', twoStarCount);
    RealmObjectBase.set(this, 'three_star_count', threeStarCount);
    RealmObjectBase.set(this, 'four_star_count', fourStarCount);
    RealmObjectBase.set(this, 'five_star_count', fiveStarCount);
  }

  Rating._();

  @override
  double get rating => RealmObjectBase.get<double>(this, 'rating') as double;
  @override
  set rating(double value) => RealmObjectBase.set(this, 'rating', value);

  @override
  int get ratingCount => RealmObjectBase.get<int>(this, 'rating_count') as int;
  @override
  set ratingCount(int value) =>
      RealmObjectBase.set(this, 'rating_count', value);

  @override
  int get oneStarCount =>
      RealmObjectBase.get<int>(this, 'one_star_count') as int;
  @override
  set oneStarCount(int value) =>
      RealmObjectBase.set(this, 'one_star_count', value);

  @override
  int get twoStarCount =>
      RealmObjectBase.get<int>(this, 'two_star_count') as int;
  @override
  set twoStarCount(int value) =>
      RealmObjectBase.set(this, 'two_star_count', value);

  @override
  int get threeStarCount =>
      RealmObjectBase.get<int>(this, 'three_star_count') as int;
  @override
  set threeStarCount(int value) =>
      RealmObjectBase.set(this, 'three_star_count', value);

  @override
  int get fourStarCount =>
      RealmObjectBase.get<int>(this, 'four_star_count') as int;
  @override
  set fourStarCount(int value) =>
      RealmObjectBase.set(this, 'four_star_count', value);

  @override
  int get fiveStarCount =>
      RealmObjectBase.get<int>(this, 'five_star_count') as int;
  @override
  set fiveStarCount(int value) =>
      RealmObjectBase.set(this, 'five_star_count', value);

  @override
  Stream<RealmObjectChanges<Rating>> get changes =>
      RealmObjectBase.getChanges<Rating>(this);

  @override
  Rating freeze() => RealmObjectBase.freezeObject<Rating>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Rating._);
    return const SchemaObject(ObjectType.embeddedObject, Rating, 'Rating', [
      SchemaProperty('rating', RealmPropertyType.double),
      SchemaProperty('ratingCount', RealmPropertyType.int,
          mapTo: 'rating_count'),
      SchemaProperty('oneStarCount', RealmPropertyType.int,
          mapTo: 'one_star_count'),
      SchemaProperty('twoStarCount', RealmPropertyType.int,
          mapTo: 'two_star_count'),
      SchemaProperty('threeStarCount', RealmPropertyType.int,
          mapTo: 'three_star_count'),
      SchemaProperty('fourStarCount', RealmPropertyType.int,
          mapTo: 'four_star_count'),
      SchemaProperty('fiveStarCount', RealmPropertyType.int,
          mapTo: 'five_star_count'),
    ]);
  }
}

class Note extends _Note with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Note(
    ObjectId id, {
    String title = '',
    String desc = '',
    String src = '',
    String authorName = '',
    String authorCredit = '',
    String coverAnim = '',
    int favoriteCount = 0,
    double rating = 0,
    int ratingCount = 0,
    required DateTime updatedAt,
    bool verified = false,
    Rating? userRating,
    Iterable<String> previews = const [],
    Iterable<ObjectId> categories = const [],
    Iterable<Review> topReviews = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Note>({
        'title': '',
        'desc': '',
        'src': '',
        'author_name': '',
        'author_credit': '',
        'cover_anim': '',
        'favourite_count': 0,
        'rating': 0,
        'rating_count': 0,
        'created_at': DateTime.now(),
        'updated_at': DateTime.now(),
        'verified': false,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'desc', desc);
    RealmObjectBase.set(this, 'src', src);
    RealmObjectBase.set(this, 'author_name', authorName);
    RealmObjectBase.set(this, 'author_credit', authorCredit);
    RealmObjectBase.set(this, 'cover_anim', coverAnim);
    RealmObjectBase.set(this, 'favourite_count', favoriteCount);
    RealmObjectBase.set(this, 'rating', rating);
    RealmObjectBase.set(this, 'rating_count', ratingCount);
    RealmObjectBase.set(this, 'created_at', createdAt);
    RealmObjectBase.set(this, 'updated_at', updatedAt);
    RealmObjectBase.set(this, 'verified', verified);
    RealmObjectBase.set(this, 'user_rating', userRating);
    RealmObjectBase.set<RealmList<String>>(
        this, 'previews', RealmList<String>(previews));
    RealmObjectBase.set<RealmList<ObjectId>>(
        this, 'categories', RealmList<ObjectId>(categories));
    RealmObjectBase.set<RealmList<Review>>(
        this, 'top_reviews', RealmList<Review>(topReviews));
  }

  Note._();

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
  String get authorName =>
      RealmObjectBase.get<String>(this, 'author_name') as String;
  @override
  set authorName(String value) =>
      RealmObjectBase.set(this, 'author_name', value);

  @override
  String get authorCredit =>
      RealmObjectBase.get<String>(this, 'author_credit') as String;
  @override
  set authorCredit(String value) =>
      RealmObjectBase.set(this, 'author_credit', value);

  @override
  String get coverAnim =>
      RealmObjectBase.get<String>(this, 'cover_anim') as String;
  @override
  set coverAnim(String value) => RealmObjectBase.set(this, 'cover_anim', value);

  @override
  RealmList<String> get previews =>
      RealmObjectBase.get<String>(this, 'previews') as RealmList<String>;
  @override
  set previews(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<ObjectId> get categories =>
      RealmObjectBase.get<ObjectId>(this, 'categories') as RealmList<ObjectId>;
  @override
  set categories(covariant RealmList<ObjectId> value) =>
      throw RealmUnsupportedSetError();

  @override
  int get favoriteCount =>
      RealmObjectBase.get<int>(this, 'favourite_count') as int;
  @override
  set favoriteCount(int value) =>
      RealmObjectBase.set(this, 'favourite_count', value);

  @override
  double get rating => RealmObjectBase.get<double>(this, 'rating') as double;
  @override
  set rating(double value) => RealmObjectBase.set(this, 'rating', value);

  @override
  int get ratingCount => RealmObjectBase.get<int>(this, 'rating_count') as int;
  @override
  set ratingCount(int value) =>
      RealmObjectBase.set(this, 'rating_count', value);

  @override
  RealmList<Review> get topReviews =>
      RealmObjectBase.get<Review>(this, 'top_reviews') as RealmList<Review>;
  @override
  set topReviews(covariant RealmList<Review> value) =>
      throw RealmUnsupportedSetError();

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
  bool get verified => RealmObjectBase.get<bool>(this, 'verified') as bool;
  @override
  set verified(bool value) => RealmObjectBase.set(this, 'verified', value);

  @override
  Rating? get userRating =>
      RealmObjectBase.get<Rating>(this, 'user_rating') as Rating?;
  @override
  set userRating(covariant Rating? value) =>
      RealmObjectBase.set(this, 'user_rating', value);

  @override
  Stream<RealmObjectChanges<Note>> get changes =>
      RealmObjectBase.getChanges<Note>(this);

  @override
  Note freeze() => RealmObjectBase.freezeObject<Note>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Note._);
    return const SchemaObject(ObjectType.realmObject, Note, 'Note', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('desc', RealmPropertyType.string),
      SchemaProperty('src', RealmPropertyType.string),
      SchemaProperty('authorName', RealmPropertyType.string,
          mapTo: 'author_name'),
      SchemaProperty('authorCredit', RealmPropertyType.string,
          mapTo: 'author_credit'),
      SchemaProperty('coverAnim', RealmPropertyType.string,
          mapTo: 'cover_anim'),
      SchemaProperty('previews', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('categories', RealmPropertyType.objectid,
          collectionType: RealmCollectionType.list),
      SchemaProperty('favoriteCount', RealmPropertyType.int,
          mapTo: 'favourite_count'),
      SchemaProperty('rating', RealmPropertyType.double),
      SchemaProperty('ratingCount', RealmPropertyType.int,
          mapTo: 'rating_count'),
      SchemaProperty('topReviews', RealmPropertyType.object,
          mapTo: 'top_reviews',
          linkTarget: 'Review',
          collectionType: RealmCollectionType.list),
      SchemaProperty('createdAt', RealmPropertyType.timestamp,
          mapTo: 'created_at'),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp,
          mapTo: 'updated_at'),
      SchemaProperty('verified', RealmPropertyType.bool,
          indexType: RealmIndexType.regular),
      SchemaProperty('userRating', RealmPropertyType.object,
          mapTo: 'user_rating', optional: true, linkTarget: 'Rating'),
    ]);
  }
}
