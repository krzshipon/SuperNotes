// ignore_for_file: constant_identifier_names
import 'package:super_notes_admin/app/app_middleware.dart';
import 'package:super_notes_admin/app/modules/auth/bindings/auth_binding.dart';
import 'package:super_notes_admin/app/modules/auth/views/auth_view.dart';
import 'package:super_notes_admin/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:super_notes_admin/app/modules/dashboard/views/dashboard_view.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      middlewares: [GlobalMiddleware()],
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
      middlewares: [GlobalMiddleware()],
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    )
  ];
}
