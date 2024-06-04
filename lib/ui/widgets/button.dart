import 'package:flutter/material.dart';
import 'package:AeroTaxi/core/theme/colors_theme.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.onTap,
    this.border,
    this.margin,
    this.padding,
    this.leading,
    this.trailing,
    this.spacing,
    this.textStyle,
    this.height = 48,
    this.enabled = true,
    this.backgroundColor,
    this.borderRadius = 100,
    required this.label,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final bool enabled;
  final String label;
  final double? height;
  final Function? onTap;
  final Widget? leading;
  final Widget? trailing;
  final Widget? spacing;
  final BoxBorder? border;
  final double? borderRadius;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.zero,
      child: InkWell(
        onTap: _onTap,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: _validateEnabled(context),
            borderRadius: BorderRadius.circular(borderRadius!),
            border: border,
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: mainAxisAlignment!,
            crossAxisAlignment: crossAxisAlignment!,
            children: [
              if (leading != null) leading!,
              if (spacing != null) spacing!,
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  color: enabled ? Colors.white : ColorsAppTheme.primaryColor,
                  fontWeight: FontWeight.w400,
                ).merge(textStyle),
              ),
              if (spacing != null) spacing!,
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }

  void _onTap() {
    if (enabled) {
      onTap?.call();
    }
  }

  Color? _validateEnabled(BuildContext context) {
    return enabled
        ? backgroundColor ?? ColorsAppTheme.primaryColor
        : ColorsAppTheme.secondColor;
  }
}
