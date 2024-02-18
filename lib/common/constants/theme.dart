import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  primaryColor: Color(Colors.black.value),
  scaffoldBackgroundColor: Color(Colors.black.value),
  colorScheme: ColorScheme.dark(
    primary: Color(Colors.white.value),
    secondary: Color(Colors.white.value),
    surface: Color(Colors.black.value),
    background: Color(Colors.white.value),
    error: Color(Colors.black.value),
    onPrimary: Color(Colors.white.value),
    onSecondary: Color(Colors.white.value),
    onSurface: Color(Colors.white.value),
    onBackground: Color(Colors.black.value),
    onError: Color(Colors.black.value),
    surfaceTint: Color(Colors.white.value),
  ),
  iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          overlayColor: MaterialStateProperty.all(Colors.transparent))),
);

ThemeData light = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(Colors.black.value),
  scaffoldBackgroundColor: const Color(0xFF0A0E21),
);
