import 'package:flutter/material.dart';

import '../shared/app_ui_helpers.dart';
import 'app_cards.dart';
import 'app_text.dart';

enum ButtonType { positive, negative }

const double kpButtonProgressbarPadding = 5;

class CSButton extends StatelessWidget {
  final String title;
  final bool isDisabled;
  final bool isBusy;
  final bool isOutlined;
  final Widget? leading;
  final void Function()? onTap;
  final double? width;
  final ButtonType type;

  //property
  final double height = 40.0;
  final double cornerRadius = 5.0;

  const CSButton(
      {Key? key,
      required this.title,
      this.isDisabled = false,
      this.isBusy = false,
      this.onTap,
      this.leading,
      this.width,
      this.type = ButtonType.positive})
      : isOutlined = false,
        super(key: key);

  const CSButton.outline(
      {super.key,
      required this.title,
      this.onTap,
      this.leading,
      this.width,
      this.type = ButtonType.positive})
      : isDisabled = false,
        isBusy = false,
        isOutlined = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !isDisabled ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        height: height,
        alignment: Alignment.center,
        decoration: !isOutlined
            ? BoxDecoration(
                color: isDisabled
                    ? Colors.blueGrey
                    : ((type == ButtonType.negative)
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(cornerRadius))
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(cornerRadius),
                border: Border.all(
                    color: Theme.of(context).colorScheme.secondary, width: 1)),
        child: !isBusy
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) leading!,
                  if (leading != null)
                    const SizedBox(
                      width: 5,
                    ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight:
                            !isOutlined ? FontWeight.normal : FontWeight.w400,
                        color: !isOutlined
                            ? Colors.white
                            : Theme.of(context).colorScheme.secondary),
                  )
                ],
              )
            : Transform.scale(
                scale: 0.7,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 8,
                ),
              ),
      ),
    );
  }
}

class CSIconButton extends StatelessWidget {
  final Function()? ontap;
  final IconData? icon;
  final String? text;
  final Color? color;
  final double? elevation;

  const CSIconButton(
      {Key? key, this.ontap, this.icon, this.text, this.color, this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CSCard(
      margin: EdgeInsets.zero,
      radius: 100,
      onTap: ontap,
      elevation: elevation,
      cardType: CSCardType.item,
      padding: (text == null)
          ? const EdgeInsets.all(7)
          : const EdgeInsets.fromLTRB(20, 10, 20, 10),
      childrens: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (text != null)
              CSText(
                text!,
                color: color ?? Theme.of(context).colorScheme.secondary,
              ),
            if (text != null) horizontalSpaceTiny,
            if (icon != null)
              Icon(
                icon,
                color: color,
              ),
          ],
        ),
      ],
    );
  }
}
