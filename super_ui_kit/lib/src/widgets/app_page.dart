import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CSHomeWidget extends StatelessWidget {
  final Widget? child;
  final AppBar? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final EdgeInsetsGeometry? padding;

  const CSHomeWidget(
      {Key? key,
      this.child,
      this.appBar,
      this.bottomNavigationBar,
      this.floatingActionButton,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
          //this color must be equal to the WaterDropNavBar backgroundColor
          systemNavigationBarColor: Theme.of(context).colorScheme.primary,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        appBar: appBar,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: SafeArea(
          child: Padding(padding: padding ?? EdgeInsets.zero, child: child),
        ),
      ),
    );
  }
}
