import 'package:flutter/material.dart';
import 'package:super_ui_kit/src/extensions/box_constraint_ext.dart';
import 'package:super_ui_kit/src/extensions/build_context_ext.dart';

enum CSCardType { item, form }

const double kwCardWidthS = 250;
const double kwCardWidthM = 400;
const double kwCardWidthL = 500;

const double kmCardMarginS = 10;
const double kmCardMarginM = 15;
const double kmCardMarginL = 20;

const double kpCardPaddingS = 15;
const double kpCardPaddingM = 20;
const double kpCardPaddingL = 30;

const int kCardSplashAlpha = 45;

class CSCard extends StatelessWidget {
  final void Function()? onTap;
  final List<Widget> childrens;
  final CSCardType cardType;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? radius;
  final MainAxisAlignment mainAxisAlignment;
  final double? elevation;

  const CSCard(
      {super.key,
      this.onTap,
      required this.childrens,
      this.cardType = CSCardType.item,
      this.padding,
      this.margin,
      this.radius,
      this.elevation = 7,
      this.mainAxisAlignment = MainAxisAlignment.start});
  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        return Card(
          clipBehavior: Clip.antiAlias,
          margin: (margin != null)
              ? margin
              : (cardType == CSCardType.form)
                  ? EdgeInsets.all(constraints.responsiveValue(
                          small: kmCardMarginS,
                          medium: kmCardMarginM,
                          large: kmCardMarginL) ??
                      kmCardMarginL)
                  : const EdgeInsets.all(kmCardMarginS),
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 15),
            ),
          ),
          child: InkWell(
            splashColor: Theme.of(context)
                .colorScheme
                .primary
                .withAlpha(kCardSplashAlpha),
            onTap: onTap,
            child: SizedBox(
              width: (cardType == CSCardType.form)
                  ? constraints.responsiveValue(
                        small:
                            (context.isLandscape) ? kwCardWidthL : kwCardWidthS,
                        medium: kwCardWidthM,
                        large: kwCardWidthL,
                      ) ??
                      kwCardWidthL
                  : null,
              child: Padding(
                padding: (padding != null)
                    ? padding!
                    : (cardType == CSCardType.form)
                        ? EdgeInsets.all(constraints.responsiveValue(
                                small: kpCardPaddingS,
                                medium: kpCardPaddingM,
                                large: kpCardPaddingL) ??
                            kpCardPaddingL)
                        : const EdgeInsets.all(kpCardPaddingM),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: mainAxisAlignment,
                  children: childrens,
                ),
              ),
            ),
          ),
        );
      });
}
