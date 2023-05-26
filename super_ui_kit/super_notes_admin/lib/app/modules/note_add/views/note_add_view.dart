import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/note_add_controller.dart';

class NoteAddView extends GetView<NoteAddController> {
  const NoteAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NoteAddView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NoteAddView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
