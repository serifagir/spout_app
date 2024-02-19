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
  primaryColor: Color(Colors.white.value),
  scaffoldBackgroundColor: Color(Colors.white.value),
  colorScheme: ColorScheme.light(
    primary: Color(Colors.black.value),
    secondary: Color(Colors.black.value),
    surface: Color(Colors.white.value),
    background: Color(Colors.black.value),
    error: Color(Colors.white.value),
    onPrimary: Color(Colors.black.value),
    onSecondary: Color(Colors.black.value),
    onSurface: Color(Colors.black.value),
    onBackground: Color(Colors.white.value),
    onError: Color(Colors.white.value),
    surfaceTint: Color(Colors.black.value),
  ),
  iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          overlayColor: MaterialStateProperty.all(Colors.transparent))),
);
