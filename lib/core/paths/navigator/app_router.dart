import 'package:AeroTaxi/ui/views/faqs_view/faqs_view.dart';
import 'package:AeroTaxi/ui/views/home_view/home_view.dart';
import 'package:AeroTaxi/ui/views/legal_document_view/legal_document_view.dart';
import 'package:AeroTaxi/ui/views/services_view/services_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:AeroTaxi/core/paths/navigator/route_guards/main_guard.dart';
import 'package:AeroTaxi/ui/views/create_task_view/create_task_view.dart';
import 'package:AeroTaxi/ui/views/login_view/login_view.dart';
import 'package:AeroTaxi/ui/views/main_view/main_view.dart';
import 'package:AeroTaxi/ui/views/profile_view/profile_view.dart';
import 'package:AeroTaxi/ui/views/tasks_view/task_view.dart';

import 'route_guards/auth_guard.dart';

part 'app_router.gr.dart';
// Routes
part 'auth_routes.dart';
part 'main_routes.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        ...authRoutes,
        ...mainRoutes,
      ];
}
