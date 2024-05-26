import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class EmptyDataLottie extends StatelessWidget {
  const EmptyDataLottie({
    super.key,
    required this.path,
    required this.label,
    this.textStyle,
  });

  final String path;
  final String label;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Lottie.asset(
          path,
          alignment: Alignment.topCenter,
          repeat: true,
          animate: true,
        ),
        Center(
          child: Text(
            label,
            maxLines: 3,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ).merge(textStyle),
          ),
        )
      ],
    );
  }
}
