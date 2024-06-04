import 'package:auto_route/auto_route.dart';
import 'package:AeroTaxi/core/paths/navigator/app_router.dart';
import 'package:AeroTaxi/data/models/bottombar_model.dart';
import 'package:flutter/material.dart';

class StoreMainView {
  static List<PageRouteInfo> supplierRoutes = [
    const HomeRoute(),
    const ServicesRoute(),
    const TasksRoute(),
    const ProfileRoute(),
  ];

  static const List<BottomBarModel> supplierPages = [
    BottomBarModel(
      icon: Icons.home,
      label: "Servicios",
    ),
    BottomBarModel(
      icon: Icons.spatial_tracking_rounded,
      label: "Servicios",
    ),
    BottomBarModel(
      icon: Icons.warning_amber_rounded,
      label: "Reportes",
    ),
    BottomBarModel(
      icon: Icons.person,
      label: "Perfil",
    ),
  ];
}
