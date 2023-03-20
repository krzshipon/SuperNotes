import 'package:realm/realm.dart';

part 'profile.g.dart';

@RealmModel()
class _Profile {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  @Indexed()
  String name = '';

  @MapTo('mobile')
  @Indexed()
  String mobile = '';
  @Indexed()
  String email = '';

  String password = '';

  @MapTo('like_count')
  String likeCount = '';

  @MapTo('download_count')
  String downloadCount = '';

  @MapTo('upload_count')
  String uploadCount = '';

  String img = '';

  @MapTo('fav_notes')
  List<String> favNotes = [];

  @MapTo('create_date')
  DateTime createDate = DateTime.now();

  @MapTo('update_date')
  DateTime updateDate = DateTime.now();

  @Indexed()
  bool verified = false;

  @MapTo('email_verified')
  bool emailVerified = false;

  @MapTo('mobile_verified')
  bool mobileVerified = false;
}
