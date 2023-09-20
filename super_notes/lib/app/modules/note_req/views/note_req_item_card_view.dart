import 'package:flutter/material.dart';

import 'package:super_notes/app/data/models/note_req.dart';
import 'package:super_notes/app/util/app_constants.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class NoteReqItemCardView extends GetView {
  final NoteReq req;
  final void Function()? ontap;

  const NoteReqItemCardView(this.req, {super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return CSCard(onTap: ontap, children: [
      IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CSText.label(
                          req.desc,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      verticalSpaceTiny,
                      Row(
                        children: [
                          CSText.label('Status: ${req.status}'),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: CSText.label(
                                DateFormat(kNoteReqDateFormat)
                                    .format(req.createdAt),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(
                Icons.arrow_forward_sharp,
                color: Get.theme.colorScheme.primary,
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
