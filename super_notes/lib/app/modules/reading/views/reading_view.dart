import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/reading_controller.dart';

class ReadingView extends GetView<ReadingController> {
  const ReadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CSIconButton(
            icon: Icons.arrow_upward_sharp,
            onTap: () async {
              int currentPage = controller.currentPage.value;
              currentPage -= 2;
              if (currentPage >= 0) {
                await controller.pdfViewController.future.then((controller) {
                  controller.setPage(currentPage);
                });
              }
            },
          ),
          verticalSpaceTiny,
          CSIconButton(
            icon: Icons.double_arrow_sharp,
            onTap: () {
              Get.defaultDialog(
                title: 'gotopage'.tr,
                backgroundColor: kCardBackgroundColor,
                textConfirm: 'ok'.tr,
                confirmTextColor: Get.theme.colorScheme.onSecondary,
                textCancel: 'cancel'.tr,
                content: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:
                        CSInputField(controller: controller.tcGotoPageNumber)),
                onConfirm: () async {
                  int totalPage = controller.totalPage.value;
                  int reqPage = int.parse(controller.tcGotoPageNumber.text) - 1;
                  if (reqPage >= 0 && reqPage <= totalPage) {
                    await controller.pdfViewController.future
                        .then((controller) {
                      controller.setPage(reqPage);
                    });
                  }
                  Get.back();
                },
              );
            },
          ),
          verticalSpaceTiny,
          CSIconButton(
            icon: Icons.arrow_downward_sharp,
            onTap: () async {
              int currentPage = controller.currentPage.value;
              int totalPage = controller.totalPage.value;
              printInfo(info: '$currentPage / $totalPage');
              if (currentPage < totalPage) {
                await controller.pdfViewController.future.then((controller) {
                  controller.setPage(currentPage);
                });
              }
            },
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CSHeader(
            title: 'Read Note'.tr,
            trailing: Obx(
              () => CSText.label(
                  '${controller.currentPage + 1}/${controller.totalPage - 1}'),
            ),
          ),
          verticalSpaceSmall,
          Expanded(
            child: PDF(
              enableSwipe: true,
              //swipeHorizontal: context.orientation == Orientation.landscape,
              autoSpacing: false,
              pageFling: true,
              nightMode: true,
              onPageChanged: (page, total) {
                controller.currentPage.value = page ?? 0;
                controller.totalPage.value = total ?? 0;
              },
              onViewCreated: (pdfController) async {
                controller.pdfViewController.complete(pdfController);
                pdfController
                    .getCurrentPage()
                    .then((value) => controller.currentPage.value = value ?? 0);
                pdfController
                    .getPageCount()
                    .then((value) => controller.totalPage.value = value ?? 0);
              },
            ).cachedFromUrl(controller.noteController.note.value.src),
          ),
        ],
      ),
    );
  }
}
