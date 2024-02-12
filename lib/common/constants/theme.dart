import 'package:flutter/material.dart';

class LightModeColors {
  static const primaryColor = Colors.white;
  static const secondaryColor = Colors.black;
}

class DarkModeColors {
  static const primaryColor = Colors.black;
  static const secondaryColor = Colors.white;
}

final ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: LightModeColors.primaryColor,
    secondary: LightModeColors.secondaryColor,
  ),
);

final ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    primary: DarkModeColors.primaryColor,
    secondary: DarkModeColors.secondaryColor,
  ),
);
