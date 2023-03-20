import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

const kAnimationOptions = LiveOptions(
  delay: Duration(seconds: 0),
  showItemDuration: Duration(milliseconds: 500),
  visibleFraction: 0.05,
  reAnimateOnVisibility: false,
);

const kGridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  crossAxisSpacing: 0,
  mainAxisSpacing: 0,
  childAspectRatio: 1.15,
);

/// Wrap Ui item with animation & padding
Widget Function(
  BuildContext context,
  int index,
  Animation<double> animation,
) animationItemBuilder(
  Widget Function(int index) child, {
  EdgeInsets padding = EdgeInsets.zero,
}) =>
    (
      BuildContext context,
      int index,
      Animation<double> animation,
    ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, -0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child(index),
            ),
          ),
        );
