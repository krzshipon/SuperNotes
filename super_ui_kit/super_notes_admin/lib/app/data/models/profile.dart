import 'package:realm/realm.dart';

part 'profile.g.dart';

@RealmModel()
class _Profile {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  @MapTo('user_id')
  late String userId;
  
  @Indexed()
  String name = '';

  @MapTo('mobile')
  @Indexed()
  String mobile = '';
  @Indexed()
  String email = '';

  String password = '';

  @MapTo('like_count')
  int likeCount = 0;

  @MapTo('download_count')
  int downloadCount = 0;

  @MapTo('upload_count')
  int uploadCount = 0;

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
