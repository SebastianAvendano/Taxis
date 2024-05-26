import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool enabled;
  final double? width;
  final double? height;
  final Color? baseColor;
  final double borderRadius;
  final Color? highlightColor;
  final EdgeInsetsGeometry? margin;

  const LoadingWidget({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.enabled = true,
    this.baseColor,
    this.highlightColor,
    this.borderRadius = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey[300]!,
      highlightColor: highlightColor ?? Colors.grey[100]!,
      enabled: enabled,
      child: Container(
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
