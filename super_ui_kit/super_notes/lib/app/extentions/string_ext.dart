extension ValidationExtension on String {
  bool get isValidPassword => length > 7;
}
