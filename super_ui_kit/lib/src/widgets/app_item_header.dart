import 'package:flutter/material.dart';

import 'app_text.dart';

class CSItemHeader extends StatelessWidget {
  final String title;
  final double leftPadding;

  const CSItemHeader({Key? key, required this.title, this.leftPadding = 5.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child:
          Align(alignment: Alignment.centerLeft, child: CSText(title, style: Theme.of(context).textTheme.bodySmall,)),
    );
  }
}
