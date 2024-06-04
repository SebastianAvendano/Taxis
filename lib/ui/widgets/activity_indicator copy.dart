import 'package:flutter/material.dart';
import 'package:AeroTaxi/core/theme/colors_theme.dart';

const sizeIndicator = 30.0;

class ActivityIndicator extends StatelessWidget {
  final double size;
  final Color color;

  const ActivityIndicator({
    super.key,
    this.size = sizeIndicator,
    this.color = ColorsAppTheme.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: 4,
          valueColor: AlwaysStoppedAnimation<Color>(
            color,
          ),
        ),
      ),
    );
  }
}
