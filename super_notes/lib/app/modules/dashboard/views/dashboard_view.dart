import 'package:flutter/cupertino.dart';
import 'package:super_notes/app/data/asset_keys.dart';
import 'package:super_notes/app/modules/dashboard/views/dashboard_category_card.dart';

import 'package:super_notes/app/util/app_constants.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: kpHorizontalPadding),
        children: [
          verticalSpaceLarge,
          Padding(
            padding:
                const EdgeInsets.only(left: kmCardMarginS + kmTextExtraMargin),
            child: CSText.title('hello_user'.trParams({'name': 'Krz'})),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: kmCardMarginS + kmTextExtraMargin),
            child: CSText.label('welcome_text'.tr),
          ),
          verticalSpaceMedium,
          CSCard(
            cardType: CSCardType.item,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: CSText.title(
                            'total_notes'.trParams({'count': '4000+'}),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CSText.label(
                            DateTime.now().formatCustom(kDashBoardDateFormat),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        LottieBuilder.asset(
                          kaDashboardFeaturedAnim,
                          height: khFeaturedAnimation,
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          verticalSpaceLarge,
          Padding(
            padding:
                const EdgeInsets.only(left: kmCardMarginS + kmTextExtraMargin),
            child: CSText.title('directories'.tr),
          ),
          Obx(() => LiveGrid.options(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                options: kAnimationOptions,
                itemBuilder: animationItemBuilder((index) =>
                    DashCategoryCardView(controller.categories[index],
                        ontap: (() => controller
                            .gotoSectionView(controller.categories[index])))),
                itemCount: controller.categories.length,
                gridDelegate: kGridDelegate,
              ))
        ],
      ),
    );
  }
}
