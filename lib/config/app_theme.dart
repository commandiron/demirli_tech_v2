import 'package:flutter/material.dart';

final themeLight = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    foregroundColor: Colors.black
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff232133),
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(
        vertical: 22,
        horizontal: 64
      ),
    )
  ),
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    primary: Color(0xffF48C1F),
    primaryContainer: Color(0xffEFF0F7),
    secondaryContainer: Color(0xffF7F7FC),
    tertiaryContainer: Color(0xff201E2E)
  )
);

final themeDark = themeLight;