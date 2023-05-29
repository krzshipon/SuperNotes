import 'package:flutter/material.dart';
import 'package:super_notes_admin/app/data/models/note.dart';

import 'package:super_ui_kit/super_ui_kit.dart';

import '../../../util/app_constants.dart';

class NoteItemView extends GetView {
  final int idx;
  final Note note;
  const NoteItemView(this.note, this.idx, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CSCard(
      childrens: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.center,
                child: CSText("${idx + 1}"),
              ),
            ),
            Expanded(
              flex: 4,
              child: Align(
                alignment: Alignment.center,
                child: CSText(note.title),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: CSText(note.authorName),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: CSText.title(
                  note.createdAt.formatCustom(kDashBoardDateFormat),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
