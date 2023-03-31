import 'dart:ui';

import 'package:flutter/material.dart';

final colorSchemeLight = ColorScheme.light(
  primary: const Color(0xffF48B0B),
  secondary: const Color(0xffffffff),
  onSecondary: const Color(0xff000000),
);

final themeLight = ThemeData(
  colorScheme: colorSchemeLight,
);

final colorSchemeDark = ColorScheme.dark(
  primary: const Color(0xffF48B0B),
  secondary: const Color(0xffffffff),
  onSecondary: const Color(0xff000000),
);

final themeDark = ThemeData(
  colorScheme: colorSchemeDark,
);