import 'package:flutter/material.dart';

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
        CSHeader(
          title: "Note List",
          showLeading: false,
        ),
        verticalSpaceMedium,
        CSCard(
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
        CSCard(
          childrens: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: CSText("01"),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Align(
                    alignment: Alignment.center,
                    child: CSText("A super note"),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: CSText("Krz"),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: CSText.title("25 Apr 2022"),
                  ),
                ),
              ],
            ),
          ],
        ),
        CSCard(
          childrens: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: CSText("02"),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Align(
                    alignment: Alignment.center,
                    child: CSText("A super note 2"),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: CSText("Krz"),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: CSText.title("27 Apr 2022"),
                  ),
                ),
              ],
            ),
          ],
        ),
        ListView.builder(
          itemBuilder: (context, idx) => Text(controller.notes[idx].title),
          shrinkWrap: true,
          itemCount: controller.notes.length,
          physics: ClampingScrollPhysics(),
        ),
      ],
    );
  }
}
