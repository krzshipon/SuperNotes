import 'package:flutter/material.dart';

import 'package:super_notes/app/modules/search/views/search_card_view.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../../note/views/note_item_card_view.dart';
import '../controllers/search_controller.dart' as search_controller;

class SearchView extends GetView<search_controller.SearchController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      padding: const EdgeInsets.symmetric(horizontal: kpHorizontalPadding),
      child: Center(
        child: Column(
          children: [
            verticalSpaceLarge,
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: kmCardMarginS + kmTextExtraMargin),
                child: CSText.title('search_note'.tr),
              ),
            ),
            verticalSpaceSmall,
            SearchCardView(
              tc: controller.tcSearch,
              onSubmitted: (value) => {
                printInfo(info: "Searched text: $value"),
                controller.searchRelatedNote(value)
              },
            ),
            Expanded(
              child: Obx(
                () => LiveList.options(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  options: kAnimationOptions,
                  // Like GridView.builder, but also includes animation property
                  itemBuilder: animationItemBuilder(
                    (index) => NoteItemCardView(controller.notes[index],
                        ontap: () =>
                            controller.gotoNoteView(controller.notes[index])),
                  ),
                  // Other properties correspond to the `ListView.builder` / `ListView.separated` widget
                  itemCount: controller.notes.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
