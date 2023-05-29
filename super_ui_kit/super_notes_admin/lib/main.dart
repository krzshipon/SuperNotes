import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import 'app/data/asset_keys.dart';
import 'app/routes/app_pages.dart';
import 'app/services/auth_service.dart';
import 'app/services/db_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Init DB
  await GetStorage.init();

  ///AWAIT SERVICES INITIALIZATION.
  await initServices();

  // //App language
  // var appLangCode = GetStorage().read<String>(kCurrentLangCode);
  // var locale = appLangCode?.getLocaleFromCode() ?? kDefaultLocale;

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: Get.find<AuthService>().currentUser.value == null
          ? AppPages.INITIAL
          : Routes.HOME,
      getPages: AppPages.routes,
      darkTheme: appDarkTheme,
      enableLog: true,
    ),
  );
}

initServices() async {
  ///Initializing.. realm service
  final realmConfig =
      json.decode(await rootBundle.loadString(kRealmConfigFile));
  String appId = realmConfig['appId'];
  Uri baseUrl = Uri.parse(realmConfig['baseUrl']);
  await Get.putAsync(() => AuthService().init(appId, baseUrl));

  ///Initialize DB Service
  Get.put(DbService());

  ///Put Other service here...
}
