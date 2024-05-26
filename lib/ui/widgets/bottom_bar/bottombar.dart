import 'package:flutter/material.dart';
import 'package:task/core/theme/colors_theme.dart';
import 'package:task/data/models/bottombar_model.dart';
import 'package:task/ui/widgets/bottom_bar/animated_bottombar_icon.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.pages,
    required this.currentPage,
    this.onPressed,
  });

  final int currentPage;
  final List<BottomBarModel> pages;
  final void Function(int)? onPressed;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 8,
      items: buildOptions(context),
      currentIndex: currentPage,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedFontSize: 13.0,
      unselectedFontSize: 13.0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: ColorsAppTheme.primaryColor,
      unselectedItemColor: ColorsAppTheme.secondColor,
      onTap: onPressed,
    );
  }

  List<BottomNavigationBarItem> buildOptions(BuildContext context) {
    return List.generate(pages.length, (int index) {
      return BottomNavigationBarItem(
        icon: _buildRegularIcon(index),
        label: pages[index].label,
      );
    });
  }

  Widget _buildRegularIcon(int index) {
    return AnimatedBottomBarIcon(
      urlAsset: pages[index].icon,
      isActive: currentPage == index,
    );
  }
}
