part of 'app_router.dart';

List<AutoRoute> authRoutes = [
  AutoRoute(path: '/login', page: LoginRoute.page),
  AutoRoute(
    path: '/',
    page: LoginRoute.page,
    guards: [AuthGuard()],
  ),
];
