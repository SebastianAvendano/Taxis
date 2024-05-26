import 'package:flutter/material.dart';
import 'package:task/core/theme/colors_theme.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    super.key,
    this.margin,
    this.padding,
    required this.child,
    this.alignment = Alignment.center,
  });

  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: .5,
            color: ColorsAppTheme.blueColor.withOpacity(0.4),
          ),
          top: BorderSide(
            width: .5,
            color: ColorsAppTheme.blueColor.withOpacity(0.4),
          ),
        ),
      ),
      margin: margin,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: child,
    );
  }
}
