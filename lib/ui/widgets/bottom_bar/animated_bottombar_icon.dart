import 'package:AeroTaxi/core/theme/colors_theme.dart';
import 'package:flutter/material.dart';

class AnimatedBottomBarIcon extends StatefulWidget {
  const AnimatedBottomBarIcon({
    super.key,
    required this.iconData,
    required this.isActive,
  });

  final bool isActive;
  final IconData iconData;

  @override
  State<AnimatedBottomBarIcon> createState() => _AnimatedBottomBarIconState();
}

class _AnimatedBottomBarIconState extends State<AnimatedBottomBarIcon> {
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _isActive = widget.isActive;
  }

  @override
  void didUpdateWidget(covariant AnimatedBottomBarIcon oldWidget) {
    if (widget.isActive != oldWidget.isActive) {
      setState(() {
        _isActive = widget.isActive;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      margin: const EdgeInsets.only(bottom: 4),
      child: Icon(
        widget.iconData,
        color:
            _isActive ? ColorsAppTheme.primaryColor : ColorsAppTheme.blueColor,
      ),
    );
  }
}
