import 'package:flutter/material.dart';

class CSToupleText extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? onTap;

  const CSToupleText(
      {Key? key, required this.text1, required this.text2, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Text(
            text1,
            style: Theme.of(context).textTheme.bodyLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
          Text(
            " $text2",
            style: Theme.of(context).textTheme.bodyLarge
                ?.copyWith(color: Theme.of(context).colorScheme.secondary),
          )
        ]));
  }
}
