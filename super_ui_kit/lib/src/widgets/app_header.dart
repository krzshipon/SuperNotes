import 'package:flutter/material.dart';

import 'app_buttons.dart';
import 'app_text.dart';

enum HeaderType { home, other }

class CSHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final HeaderType headerType;
  final void Function()? onLeftIconClick;

  const CSHeader({
    Key? key,
    this.title = '',
    this.trailing,
    this.headerType = HeaderType.other,
    this.onLeftIconClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Center(
              child: CSIconButton(
            icon: (headerType == HeaderType.home)
                ? Icons.home_sharp
                : Icons.arrow_back_sharp,
            ontap: (onLeftIconClick != null)
                ? onLeftIconClick
                : (headerType == HeaderType.home)
                    ? null
                    : () => Navigator.of(context).pop(),
          )),
        ),
        Expanded(
          flex: 6,
          child: Align(
            alignment: Alignment.center,
            child: CSText(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: trailing,
          ),
        ),
      ],
    );
  }
}
