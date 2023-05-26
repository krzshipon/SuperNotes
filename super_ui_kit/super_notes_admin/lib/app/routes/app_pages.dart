import 'package:super_ui_kit/super_ui_kit.dart';

import '../middleware/app_middleware.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/note_add/bindings/note_add_binding.dart';
import '../modules/note_add/views/note_add_view.dart';
import '../modules/note_req/bindings/note_req_binding.dart';
import '../modules/note_req/views/note_req_view.dart';
import '../modules/notes/bindings/notes_binding.dart';
import '../modules/notes/views/notes_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
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
    ),
    GetPage(
      name: _Paths.NOTES,
      page: () => const NotesView(),
      binding: NotesBinding(),
      middlewares: [GlobalMiddleware()],
    ),
    GetPage(
      name: _Paths.NOTE_ADD,
      page: () => const NoteAddView(),
      binding: NoteAddBinding(),
    ),
    GetPage(
      name: _Paths.NOTE_REQ,
      page: () => const NoteReqView(),
      binding: NoteReqBinding(),
    ),
  ];
}
