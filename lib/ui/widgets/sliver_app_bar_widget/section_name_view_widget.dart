import 'package:flutter/material.dart';
import 'package:AeroTaxi/core/theme/colors_theme.dart';

class SectionNameView extends StatelessWidget {
  const SectionNameView(
      {super.key, required this.title, this.margin, this.textStyle});

  final String title;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: margin ?? const EdgeInsets.fromLTRB(25, 5, 0, 30),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ColorsAppTheme.primaryColor,
              width: 2,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title,
            style: textStyle ??
                const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: ColorsAppTheme.primaryColor,
                ),
          ),
        ),
      ),
    );
  }
}
