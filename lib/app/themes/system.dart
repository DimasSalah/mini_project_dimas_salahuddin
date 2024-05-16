import 'package:flutter/material.dart';
import 'package:tatrupiah_si/app/themes/colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: white,
    colorSchemeSeed: dark,
    appBarTheme: AppBarTheme(
      backgroundColor: white,
      surfaceTintColor: transparent,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: normal,
      selectionColor: normal,
      selectionHandleColor: normal,
    ),
  );
}