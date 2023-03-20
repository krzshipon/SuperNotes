import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/note_req_controller.dart';

class NoteReqView extends GetView<NoteReqController> {
  const NoteReqView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NoteReqView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NoteReqView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
