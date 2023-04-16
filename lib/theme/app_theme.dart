import 'package:flutter/material.dart';

final themeLight = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.white,
  ),
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    primary: Color(0xffF48C1F),
    primaryContainer: Color(0xffEFF0F7),
    secondaryContainer: Color(0xffF7F7FC),
  )
);

final themeDark = themeLight;