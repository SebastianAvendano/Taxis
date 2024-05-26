import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors_theme.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Lato',
    primaryColor: ColorsAppTheme.primaryColor,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    colorScheme: const ColorScheme.light()
        .copyWith(
          brightness: Brightness.light,
          primary: ColorsAppTheme.primaryColor,
          secondary: ColorsAppTheme.secondColor,
        )
        .copyWith(surface: Colors.white),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Lato',
    primaryColor: ColorsAppTheme.primaryColor,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      brightness: Brightness.dark,
      primary: ColorsAppTheme.primaryColor,
      secondary: Colors.white,
    ),
  );
}
