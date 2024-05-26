part of 'app_router.dart';

List<AutoRoute> mainRoutes = [
  AutoRoute(
    path: '/main',
    page: MainRoute.page,
    guards: [MainGuard()],
    children: [
      AutoRoute(
        path: 'profile',
        maintainState: false,
        page: ProfileRoute.page,
      ),
      AutoRoute(
        path: 'tasks',
        maintainState: false,
        page: TasksRoute.page,
      ),
    ],
  ),
  AutoRoute(
    path: '/createTask/',
    page: CreateTaskRoute.page,
    guards: [MainGuard()],
  ),
];
