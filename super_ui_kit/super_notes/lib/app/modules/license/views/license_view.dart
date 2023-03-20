import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/license_controller.dart';

class LicenseView extends GetView<LicenseController> {
  const LicenseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LicenseView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LicenseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
