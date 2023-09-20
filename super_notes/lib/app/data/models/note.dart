import 'package:realm/realm.dart';
import 'package:super_notes/app/data/models/review.dart';

part 'note.g.dart';

@RealmModel(ObjectType.embeddedObject)
class _Rating {
  double rating = 0;
  @MapTo("rating_count")
  int ratingCount = 0;
  @MapTo("one_star_count")
  int oneStarCount = 0;
  @MapTo("two_star_count")
  int twoStarCount = 0;
  @MapTo("three_star_count")
  int threeStarCount = 0;
  @MapTo("four_star_count")
  int fourStarCount = 0;
  @MapTo("five_star_count")
  int fiveStarCount = 0;
}

@RealmModel()
class _Note {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  @Indexed()
  String title = '';
  String desc = '';
  String src = '';
  @Ignored()
  String? localSrc;

  @MapTo("author_name")
  String authorName = '';
  @MapTo("author_credit")
  String authorCredit = '';

  @MapTo("cover_anim")
  String coverAnim = '';
  List<String> previews = [];

  List<ObjectId> categories = [];
  @MapTo("favourite_count")
  int favoriteCount = 0;
  double rating = 0;
  @MapTo("rating_count")
  int ratingCount = 0;

  @MapTo('top_reviews')
  List<$Review> topReviews = [];

  @MapTo('created_at')
  DateTime createdAt = DateTime.now();
  @MapTo('updated_at')
  DateTime updatedAt = DateTime.now();
  @Indexed()
  bool verified = false;
  @Ignored()
  bool isFav = false;
  @MapTo("user_rating")
  late _Rating? userRating;
}
