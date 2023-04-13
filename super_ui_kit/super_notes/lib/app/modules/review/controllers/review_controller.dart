import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:super_notes/app/data/models/note.dart';
import 'package:super_notes/app/data/models/review.dart';
import 'package:super_notes/app/modules/note/controllers/note_controller.dart';
import 'package:super_notes/app/services/auth_service.dart';
import 'package:super_notes/app/services/db_service.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class ReviewController extends GetxController {
  final _dbService = Get.find<DbService>();
  final _authService = Get.find<AuthService>();

  final tcReview = TextEditingController();

  final rate = 5.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  saveReview() {
    if (tcReview.text.isNotEmpty) {
      //Get the note
      var noteController = Get.find<NoteController>();

      var rat = noteController.note.value.userRating;
      //Update precalculated data
      var rating = Rating(
        rating: rat?.rating ?? 0.0,
        ratingCount: rat?.ratingCount ?? 0,
        fiveStarCount: rat?.fiveStarCount ?? 0,
        fourStarCount: rat?.fourStarCount ?? 0,
        threeStarCount: rat?.threeStarCount ?? 0,
        twoStarCount: rat?.twoStarCount ?? 0,
        oneStarCount: rat?.oneStarCount ?? 0,
      );

      _dbService.realm?.write(() {
        switch (rate.value) {
          case 1:
            rating.oneStarCount++;
            break;
          case 2:
            rating.twoStarCount++;
            break;
          case 3:
            rating.threeStarCount++;
            break;
          case 4:
            rating.fourStarCount++;
            break;
          case 5:
            rating.fiveStarCount++;
            break;
        }

        rating.rating = ((rating.rating * rating.ratingCount) + rate.value) /
            (rating.ratingCount + 1);

        rating.ratingCount++;

        //Transfer rating if top ratings size exceed
        if (noteController.note.value.topReviews.length > 4) {
          var review = noteController.note.value.topReviews.removeLast();
          _dbService.realm?.add<Review>(review);
        }

        //add in top rating
        noteController.note.value.topReviews.add(
          Review(
            ObjectId(),
            value: rate.value.toDouble(),
            updatedAt: DateTime.now(),
            text: tcReview.text,
            user: BasicUser(
              ObjectId.fromHexString(
                _authService.currentUser.value!.id,
              ),
              img: noteController.profile?.img ?? '',
              name: noteController.profile?.name ?? '',
            ),
          ),
        );

        noteController.note.value.userRating = rating;
        noteController.note.refresh();
      });
    }
    Get.back();
  }
}
