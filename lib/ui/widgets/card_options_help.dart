import 'package:AeroTaxi/core/theme/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CardOptionHelp extends StatelessWidget {
  const CardOptionHelp({
    super.key,
    this.onTap,
    required this.title,
    required this.description,
    this.icon,
    this.date,
  });

  final IconData? icon;
  final void Function()? onTap;
  final String title, description;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null
          ? Icon(
              icon,
              size: 25,
              color: ColorsAppTheme.blueColor,
            )
          : null,
      title: _titleCard(),
      trailing: const Icon(
        Feather.arrow_right,
        size: 25,
        color: ColorsAppTheme.blueColor,
      ),
      onTap: onTap,
    );
  }

  Widget _titleCard() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _textTitle(
            text: title.toUpperCase(),
            fontWeight: FontWeight.w600,
            size: 12,
            color: Colors.black,
            maxLines: 2,
          ),
          const SizedBox(height: 6),
          _textTitle(
            text: description,
            fontWeight: FontWeight.w400,
            size: 12,
            color: Colors.black,
          ),
          const SizedBox(height: 6),
          if (date != null)
            _textTitle(
              text: date!,
              fontWeight: FontWeight.w400,
              size: 14,
              color: ColorsAppTheme.blueColor,
            )
        ],
      );

  Widget _textTitle({
    required String text,
    required FontWeight fontWeight,
    required double size,
    required Color color,
    int? maxLines,
  }) =>
      Text(
        text,
        maxLines: maxLines ?? 1,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: size,
          fontWeight: fontWeight,
          color: color,
        ),
      );
}
