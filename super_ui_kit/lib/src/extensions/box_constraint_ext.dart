import 'package:flutter/material.dart';

const mediumDevice = 600;
const largeDevice = 900;

extension BreakpointUtils on BoxConstraints {
  bool get isSmall => 0 <= maxWidth && maxWidth < mediumDevice;
  bool get isMedium => mediumDevice <= maxWidth && maxWidth < largeDevice;
  bool get isLarge => !isSmall && !isMedium;

  T? responsiveValue<T>({
    T? small,
    T? medium,
    T? large,
    T? xLarge,
  }) {
    if (isSmall && small != null) return small;
    if (isMedium && medium != null) return medium;
    if (isLarge && large != null) return large;
    return xLarge;
  }
}
