import 'package:flutter/material.dart';
import 'package:super_notes_admin/app/modules/notes/views/note_item_view.dart';

import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/notes_controller.dart';

class NotesView extends GetView<NotesController> {
  const NotesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        verticalSpaceRegular,
        const CSHeader(
          title: "Note List", //TODO: remove hard code value
          showLeading: false,
        ),
        verticalSpaceMedium,
        const CSCard(
          elevation: 0,
          childrens: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: CSText.title("SL"),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Align(
                    alignment: Alignment.center,
                    child: CSText.title("Title"),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: CSText.title("Author"),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: CSText.title("Created"),
                  ),
                ),
              ],
            ),
          ],
        ),
        Obx(
          () => ListView.builder(
            itemBuilder: (context, idx) =>
                NoteItemView(controller.notes[idx], idx),
            shrinkWrap: true,
            itemCount: controller.notes.length,
            physics: const ClampingScrollPhysics(),
          ),
        ),
      ],
    );
  }
}
