import 'package:auto_route/auto_route.dart';
import 'package:task/core/paths/navigator/route_guards/main_guard.dart';
import 'package:task/ui/views/create_task_view/create_task_view.dart';
import 'package:task/ui/views/login_view/login_view.dart';
import 'package:task/ui/views/main_view/main_view.dart';
import 'package:task/ui/views/profile_view/profile_view.dart';
import 'package:task/ui/views/tasks_view/task_view.dart';

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
