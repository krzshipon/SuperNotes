import 'package:flutter/material.dart';

extension BuildCOntextUtil on BuildContext {
  Orientation get orientation => MediaQuery.of(this).orientation;
  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => orientation == Orientation.portrait;

  double screenWidth() => MediaQuery.of(this).size.width;
  double screenHeight() => MediaQuery.of(this).size.height;
  double screenHeightPercentage({double percentage = 1}) =>
      screenHeight() * percentage;
  double screenWidthPercentage({double percentage = 1}) =>
      screenWidth() * percentage;
}
