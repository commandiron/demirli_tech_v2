import 'package:flutter/material.dart';

const colorSchemeLight = ColorScheme.light(
  primary: Color(0xffF48B0B),
  secondary: Color(0xffffffff),
  onSecondary: Color(0xff000000),
);

final themeLight = ThemeData(
  colorScheme: colorSchemeLight,
  scaffoldBackgroundColor: Color(0xff000000),
);

const colorSchemeDark = ColorScheme.dark(
  primary: Color(0xffF48B0B),
  secondary: Color(0xffffffff),
  onSecondary: Color(0xff000000),
);

final themeDark = ThemeData(
  colorScheme: colorSchemeDark,
  scaffoldBackgroundColor: Color(0xff000000),
);