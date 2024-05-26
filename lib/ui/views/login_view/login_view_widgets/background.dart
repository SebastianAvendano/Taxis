import 'package:flutter/material.dart';

class BackgroundClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path()
      ..addOval(
        Rect.fromCenter(
          center: Offset(size.width * 0.5024155, size.height * 0.2879499),
          width: size.width * 2.719807,
          height: size.height * 1.424100,
        ),
      );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
