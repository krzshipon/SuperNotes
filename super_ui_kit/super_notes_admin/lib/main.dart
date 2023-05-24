import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ///Init DB
  await GetStorage.init();

  // ///AWAIT SERVICES INITIALIZATION.
  // await initServices();

  // //App language
  // var appLangCode = GetStorage().read<String>(kCurrentLangCode);
  // var locale = appLangCode?.getLocaleFromCode() ?? kDefaultLocale;

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      darkTheme: appDarkTheme,
      enableLog: true,
    ),
  );
}
