import 'package:realm/realm.dart';
import 'package:super_notes/app/data/models/category.dart';
import 'package:super_notes/app/data/models/intro.dart';
import 'package:super_notes/app/data/models/note.dart';
import 'package:super_notes/app/data/models/profile.dart';
import 'package:super_notes/app/data/models/review.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import 'auth_service.dart';

class DbService extends GetxService {
  final _authService = Get.find<AuthService>();
  Realm? realm;

  @override
  void onInit() {
    super.onInit();
    initDb(_authService.currentUser.value);
    _authService.currentUser.listen((user) {
      initDb(user);
    });
  }

  Future<void> initDb(User? user) async {
    if (user != null) {
      final conf = Configuration.flexibleSync(user, [
        Profile.schema,
        Category.schema,
        Note.schema,
        Review.schema,
        Intro.schema,
        BasicUser.schema
      ]);
      realm = Realm(conf);
      // Check if the subscription already exists before adding
      final profileQuery = realm!.all<Profile>();
      final noteQuery = realm!.all<Note>();
      final categoriesQuery = realm!.all<Category>();
      final introQuery = realm!.all<Intro>();

      final userSub = realm?.subscriptions.findByName('profiles');
      final categorySub = realm?.subscriptions.findByName('categories');
      final noteSub = realm?.subscriptions.findByName('notes');
      final introsSub = realm?.subscriptions.findByName('intros');
      // if (userTodoSub == null) {
      realm?.subscriptions.update((mutableSubscriptions) {
        // server-side rules ensure user only downloads their own info
        mutableSubscriptions.add(profileQuery,
            name: 'profiles', update: true);
        mutableSubscriptions.add(noteQuery,
            name: 'notes', update: true);
        mutableSubscriptions.add(categoriesQuery,
            name: 'categories', update: true);
        mutableSubscriptions.add(introQuery,
            name: 'intros', update: true);
      });
      // }
    } else {
      realm?.close();
    }
  }
}
