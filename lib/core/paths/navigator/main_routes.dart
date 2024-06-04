part of 'app_router.dart';

List<AutoRoute> mainRoutes = [
  AutoRoute(
    path: '/main',
    page: MainRoute.page,
    guards: [MainGuard()],
    children: [
      AutoRoute(
        path: 'home',
        maintainState: false,
        page: HomeRoute.page,
      ),
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
      AutoRoute(
        path: 'services',
        maintainState: false,
        page: ServicesRoute.page,
      ),
    ],
  ),
  AutoRoute(
    path: '/createTask',
    page: CreateTaskRoute.page,
    guards: [MainGuard()],
  ),
  AutoRoute(
    path: '/legaldocuments',
    page: LegalDocumentRoute.page,
    guards: [MainGuard()],
  ),
  AutoRoute(
    path: '/faqs',
    page: FaqsRoute.page,
    guards: [MainGuard()],
  ),
];
