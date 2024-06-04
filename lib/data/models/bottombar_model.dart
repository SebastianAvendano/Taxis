import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BottomBarModel {
  const BottomBarModel({
    required this.icon,
    required this.label,
    this.redirect,
  });

  final String label;
  final IconData icon;
  final PageRouteInfo<dynamic>? redirect;
}
