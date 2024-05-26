import 'package:auto_route/auto_route.dart';
import 'package:task/core/paths/navigator/app_router.dart';
import 'package:task/data/models/bottombar_model.dart';

class StoreMainView {
  static List<PageRouteInfo> supplierRoutes = [
    const TasksRoute(),
    const ProfileRoute(),
  ];

  static const List<BottomBarModel> supplierPages = [
    BottomBarModel(
      icon: 'assets/rive_animations/catalog.riv',
      label: "Tareas",
    ),
    BottomBarModel(
      icon: 'assets/rive_animations/profile.riv',
      label: "Perfil",
    ),
  ];
}
