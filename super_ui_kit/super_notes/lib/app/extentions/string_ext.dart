import 'package:super_notes/app/data/app_language_data.dart';
import 'package:super_notes/app/data/models/language.dart';

extension ValidationExtension on String {
  bool get isValidPassword => length > 7;
}

extension Languageparsing on String {
  Language? getLanguageFromCode() {
    if (isEmpty) return null;
    try {
      var lang = appLanguages
          .firstWhere((e) => e.code!.toLowerCase() == toLowerCase());
      return lang;
    } catch (e) {
      return null;
    }
  }
}
