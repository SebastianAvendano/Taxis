import 'package:flutter/material.dart';
import 'package:AeroTaxi/core/theme/colors_theme.dart';

class CustomSliverAppBar extends AnimatedWidget {
  const CustomSliverAppBar({
    this.centerTitle,
    this.titleWidget,
    this.leading,
    this.elevation,
    this.actions,
    this.backgroundColor,
    this.colorTitle,
    super.key,
    required AnimationController controller,
    required this.title,
  }) : super(listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  final String title;
  final bool? centerTitle;
  final Widget? titleWidget;
  final Widget? leading;
  final double? elevation;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? colorTitle;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      leading: leading,
      centerTitle: centerTitle,
      iconTheme: IconThemeData(color: colorTitle),
      title: _title(),
      actions: actions,
      backgroundColor: Color.lerp(
        Colors.white,
        ColorsAppTheme.primaryColor,
        _progress.value,
      ),
      toolbarHeight: kToolbarHeight,
    );
  }

  Widget _title() {
    Widget titleString = Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
    );
    return (titleWidget != null) ? titleWidget! : titleString;
  }
}
