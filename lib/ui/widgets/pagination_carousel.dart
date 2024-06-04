import 'package:flutter/material.dart';
import 'package:AeroTaxi/core/theme/colors_theme.dart';

class PaginationCarousel extends StatelessWidget {
  const PaginationCarousel({
    super.key,
    required this.quantity,
    required this.currentPage,
    this.colorSelectIndicator,
    this.colorUnSelectIndicator,
    this.sizeSelectIndicator = 10,
    this.sizeUnSelectIndicator = 9,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final int quantity;
  final int currentPage;
  final Color? colorSelectIndicator;
  final Color? colorUnSelectIndicator;
  final double? sizeSelectIndicator;
  final double? sizeUnSelectIndicator;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment!,
      crossAxisAlignment: crossAxisAlignment!,
      children: List.generate(
        quantity,
        (index) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Container(
            key: Key(index.toString()),
            margin: const EdgeInsets.only(right: 8),
            child: _indicator(
              color: _colorIndicator(index),
              size: currentPage == index
                  ? sizeSelectIndicator!
                  : sizeUnSelectIndicator!,
            ),
          ),
        ),
      ),
    );
  }

  Widget _indicator({
    required Color? color,
    required double size,
  }) =>
      Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      );

  Color? _colorIndicator(int index) {
    Color? colorSelectIndicatorValue =
        colorSelectIndicator ?? ColorsAppTheme.primaryColor;
    Color? colorUnSelectIndicatorValue =
        colorUnSelectIndicator ?? ColorsAppTheme.secondColor;
    if (currentPage == index) {
      return colorSelectIndicatorValue;
    }
    return colorUnSelectIndicatorValue;
  }
}
