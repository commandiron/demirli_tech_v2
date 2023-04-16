import 'package:flutter/material.dart';

class AppPadding {
  static EdgeInsets? allXS;
  static EdgeInsets? allS;
  static EdgeInsets? allM;
  static EdgeInsets? allL;
  static EdgeInsets? allXL;
  static EdgeInsets? allXXL;
  static EdgeInsets? allXXXL;

  static EdgeInsets? hXS;
  static EdgeInsets? hS;
  static EdgeInsets? hM;
  static EdgeInsets? hL;
  static EdgeInsets? hXL;
  static EdgeInsets? hXXL;
  static EdgeInsets? hXXXL;

  static EdgeInsets? vXS;
  static EdgeInsets? vS;
  static EdgeInsets? vM;
  static EdgeInsets? vL;
  static EdgeInsets? vXL;
  static EdgeInsets? vXXL;
  static EdgeInsets? vXXXL;

  static EdgeInsets? zero;

  static void init() {
    allXS = const EdgeInsets.all(4);
    allS = const EdgeInsets.all(8);
    allM = const EdgeInsets.all(16);
    allL = const EdgeInsets.all(32);
    allXL = const EdgeInsets.all(64);
    allXXL = const EdgeInsets.all(128);
    allXXXL = const EdgeInsets.all(256);

    hXS = const EdgeInsets.symmetric(horizontal: 4);
    hS = const EdgeInsets.symmetric(horizontal: 8);
    hM = const EdgeInsets.symmetric(horizontal: 16);
    hL = const EdgeInsets.symmetric(horizontal: 32);
    hXL = const EdgeInsets.symmetric(horizontal: 64);
    hXXL = const EdgeInsets.symmetric(horizontal: 128);
    hXXXL = const EdgeInsets.symmetric(horizontal: 256);

    vXS = const EdgeInsets.symmetric(vertical: 4);
    vS = const EdgeInsets.symmetric(vertical: 8);
    vM = const EdgeInsets.symmetric(vertical: 16);
    vL = const EdgeInsets.symmetric(vertical: 32);
    vXL = const EdgeInsets.symmetric(vertical: 64);
    vXXL = const EdgeInsets.symmetric(vertical: 128);
    vXXXL = const EdgeInsets.symmetric(vertical: 256);

    zero = EdgeInsets.zero;
  }

  static EdgeInsetsGeometry getSymmetric(EdgeInsets horizontal, EdgeInsets vertical) {
    return horizontal.add(vertical);
  }
}
