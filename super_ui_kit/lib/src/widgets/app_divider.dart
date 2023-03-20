import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

class CSDivider extends StatelessWidget {
  const CSDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 2,
      color: kDisableColor,
    );
  }
}
