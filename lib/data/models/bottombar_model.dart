import 'package:auto_route/auto_route.dart';

class BottomBarModel {
  const BottomBarModel({
    required this.icon,
    required this.label,
    this.redirect,
  });

  final String label;
  final String icon;
  final PageRouteInfo<dynamic>? redirect;
}
