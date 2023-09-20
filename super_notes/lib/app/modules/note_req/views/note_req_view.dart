import 'package:flutter/material.dart';
import 'package:super_notes/app/modules/note_req/views/note_req_item_card_view.dart';
import 'package:super_notes/generated/locales.g.dart';

import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/note_req_controller.dart';

class NoteReqView extends GetView<NoteReqController> {
  const NoteReqView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        children: [
          CSHeader(
            title: LocaleKeys.note_req_title.tr,
          ),
          verticalSpaceLarge,
          Obx(
            () => CSInputField(
              controller: controller.tcDesc,
              placeholder: LocaleKeys.note_req_desc.tr,
              maxLines: 5,
              errorText: controller.error.value,
            ),
          ),
          verticalSpaceMedium,
          CSButton.outline(
            title: LocaleKeys.submit.tr,
            onTap: () => controller.submitReq(),
          ),
          verticalSpaceMedium,
          const CSText.title('Request List'),
          verticalSpaceTiny,
          Obx(
            (() => (controller.requests.isNotEmpty)
                ? Expanded(
                    child: LiveList.options(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder:
                          animationItemBuilder(((index) => NoteReqItemCardView(
                                controller.requests[index],
                                ontap: () => controller
                                    .openNote(controller.requests[index]),
                              ))),
                      itemCount: controller.requests.length,
                      options: kAnimationOptions,
                    ),
                  )
                : const Padding(padding: EdgeInsets.zero)),
          ),
        ],
      ),
    );
  }
}
