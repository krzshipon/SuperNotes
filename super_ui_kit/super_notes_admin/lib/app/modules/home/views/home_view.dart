import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:super_notes_admin/app/modules/note_add/views/note_add_view.dart';
import 'package:super_notes_admin/app/modules/note_req/views/note_req_view.dart';
import 'package:super_notes_admin/app/modules/notes/views/notes_view.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SidebarX(
            controller: controller.sidebarXController,
            theme: SidebarXTheme(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              textStyle: const TextStyle(color: Colors.white),
              selectedTextStyle: const TextStyle(color: Colors.white),
              itemTextPadding: const EdgeInsets.only(left: 30),
              selectedItemTextPadding: const EdgeInsets.only(left: 30),
              itemDecoration: BoxDecoration(
                border: Border.all(color: Get.theme.canvasColor),
              ),
              selectedItemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Get.theme.colorScheme.secondary.withOpacity(0.37),
                ),
                // gradient: const LinearGradient(
                //   colors: [accentCanvasColor, canvasColor],
                // ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.28),
                    blurRadius: 30,
                  )
                ],
              ),
              iconTheme: const IconThemeData(
                color: Colors.white,
                size: 20,
              ),
            ),
            extendedTheme: SidebarXTheme(
              width: 200,
              decoration: BoxDecoration(
                color: Get.theme.canvasColor,
              ),
              margin: EdgeInsets.only(right: 10),
            ),
            footerDivider: divider,
            footerItems: [
              const SidebarXItem(
                icon: CupertinoIcons.star_fill,
                label: '1.0.0',
              ),
            ],
            headerBuilder: (context, extended) {
              return SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('assets/img/profile.png'),
                ),
              );
            },
            items: [
              SidebarXItem(
                icon: Icons.list_sharp,
                label: 'Notes',
                onTap: () {
                  debugPrint('Notes');
                },
              ),
              const SidebarXItem(
                icon: Icons.add,
                label: 'Add Note',
              ),
              const SidebarXItem(
                icon: Icons.request_page_sharp,
                label: 'Note Requests',
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () => _currentTab(controller.currentIndex.value),
            ),
          ),
        ],
      ),
    );
  }

  final divider = Divider(color: Colors.white.withOpacity(0.3), height: 1);

  _currentTab(int currentIdx) {
    switch (currentIdx) {
      case 0:
        return NotesView();
      case 1:
        return NoteAddView();
      case 2:
        return NoteReqView();
      default:
        return NotesView();
    }
  }
}
