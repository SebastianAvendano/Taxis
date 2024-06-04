// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:AeroTaxi/core/theme/colors_theme.dart';

class HeaderBottomSheet extends StatelessWidget {
  const HeaderBottomSheet({
    super.key,
    this.padding,
    this.decoration,
    this.textStyleTitle,
    this.title = '',
    this.showDivider = true,
    this.textAling = TextAlign.start,
    this.icon,
  });
  final Widget? icon;
  final String? title;
  final bool showDivider;
  final Decoration? decoration;
  final TextStyle? textStyleTitle;
  final EdgeInsetsGeometry? padding;
  final TextAlign? textAling;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.only(top: 10),
      decoration: decoration,
      child: ListTile(
        leading: const SizedBox.shrink(),
        title: Column(
          children: [
            _dimissibleIndicator(),
            _buildTitle(),
          ],
        ),
        trailing: IconButton(
          onPressed: () => context.router.pop(),
          color: ColorsAppTheme.primaryColor,
          icon: const Icon(Icons.close),
        ),
      ),
    );
  }

  Widget _dimissibleIndicator() => Container(
        height: 6,
        width: 60,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: ColorsAppTheme.primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
      );

  Widget _buildTitle() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: 6),
          ],
          Flexible(
            child: Text(
              title!,
              textAlign: textAling,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 18,
              ).merge(textStyleTitle),
            ),
          ),
        ],
      );
}
