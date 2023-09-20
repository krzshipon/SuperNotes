import 'package:flutter/material.dart';

import 'package:super_notes/app/data/models/note.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class NoteItemCardView extends GetView {
  final Note note;
  final void Function()? ontap;

  const NoteItemCardView(this.note, {super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return CSCard(onTap: ontap, children: [
      IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                child: Container(
                  color: Get.theme.colorScheme.primary,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.book_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
                          child: CSText(
                            note.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: CSText.label('Author: ${note.authorName}')),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CSText.label(
                          note.desc,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      verticalSpaceTiny,
                      Row(
                        children: [
                          // ignore: prefer_const_constructors
                          Icon(Icons.favorite_sharp),
                          horizontalSpaceTiny,
                          CSText.label('${note.rating}'),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: CSText.label(
                                DateFormat.yMMMMd().format(note.createdAt),
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
