import 'package:flutter/material.dart';

class AppSpace {
  static Widget? zero;
  static Widget? hXS;
  static Widget? hS;
  static Widget? hM;
  static Widget? hL;
  static Widget? hXL;
  static Widget? hXXL;
  static Widget? hXXXL;
  static Widget? vXS;
  static Widget? vS;
  static Widget? vM;
  static Widget? vL;
  static Widget? vXL;
  static Widget? vXXL;
  static Widget? vXXXL;
  static Widget? hExpanded;
  static Widget? vExpanded;

  static void init() {
    zero = const SizedBox.shrink();
    hXS = const SizedBox(width: 2);
    hS = const SizedBox(width: 4);
    hM = const SizedBox(width: 8);
    hL = const SizedBox(width: 16);
    hXL = const SizedBox(width: 32);
    hXXL = const SizedBox(width: 64);
    hXXL = const SizedBox(width: 128);

    vXS = const SizedBox(height: 2);
    vS = const SizedBox(height: 4);
    vM = const SizedBox(height: 8);
    vL = const SizedBox(height: 16);
    vXL = const SizedBox(height: 32);
    vXXL = const SizedBox(height: 64);
    vXXXL = const SizedBox(height: 128);

    hExpanded = const Expanded(child: SizedBox(width: double.infinity));
    vExpanded = const Expanded(child: SizedBox(height: double.infinity));
  }
}
