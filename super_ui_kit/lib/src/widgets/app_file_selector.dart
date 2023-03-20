import 'package:flutter/material.dart';

import '../shared/app_ui_helpers.dart';
import 'app_buttons.dart';
import 'app_cards.dart';
import 'app_input_field.dart';
import 'app_item_header.dart';
import 'app_text.dart';

class CSFileSelector extends StatelessWidget {
  final String? error;
  final String fileName;
  final Function()? ontap;

  const CSFileSelector(
      {Key? key, this.error, this.fileName = 'No file selected', this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
            padding: EdgeInsets.only(left: cornerRadius),
            child: CSItemHeader(title: 'Select File')),
        Row(children: [
          Expanded(
            child: CSCard(
              margin: EdgeInsets.zero,
              childrens: [
                verticalSpaceSmall,
                Align(
                  alignment: Alignment.centerLeft,
                  child: CSText(fileName),
                ),
                if (error != null) verticalSpaceSmall,
                if (error != null)
                  CSText(
                    error!,
                    color: Theme.of(context).colorScheme.error,
                  ),
                Divider(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                (error == null) ? verticalSpaceRegular : verticalSpaceSmall,
                CSIconButton(
                  icon: Icons.attach_file_sharp,
                  ontap: ontap,
                ),
                verticalSpaceTiny
              ],
            ),
          ),
        ]),
      ],
    );
  }
}
