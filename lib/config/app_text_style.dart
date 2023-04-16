import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle? btn;

  // Headings
  static TextStyle? h1;
  static TextStyle? h1b;
  static TextStyle? h2;
  static TextStyle? h2b;
  static TextStyle? h3;
  static TextStyle? h3b;
  static TextStyle? h4;
  static TextStyle? h4b;
  static TextStyle? h5;
  static TextStyle? h5b;

  // Body
  static TextStyle? b1;
  static TextStyle? b1b;
  static TextStyle? b2;
  static TextStyle? b2b;
  static TextStyle? b3;
  static TextStyle? b3b;
  static TextStyle? b4;
  static TextStyle? b4b;

  // Label
  static TextStyle? l1;
  static TextStyle? l1b;
  static TextStyle? l2;
  static TextStyle? l2b;

  static init(BuildContext context) {

    const baseStyle = TextStyle(fontWeight: FontWeight.w400);
    const bold = FontWeight.bold;

    h1 = baseStyle.copyWith(fontSize: 48);
    h1b = h1!.copyWith(fontWeight: bold);

    h2 = baseStyle.copyWith(fontSize: 40);
    h2b = h2!.copyWith(fontWeight: bold);

    h3 = baseStyle.copyWith(fontSize: 32);
    h3b = h3!.copyWith(fontWeight: bold);

    h4 = baseStyle.copyWith(fontSize: 28);
    h4b = h4!.copyWith(fontWeight: bold);

    h5 = baseStyle.copyWith(fontSize: 24);
    h5b = h5!.copyWith(fontWeight: bold);

    b1 = baseStyle.copyWith(fontSize: 20);
    b1b = b1!.copyWith(fontWeight: bold);

    b2 = baseStyle.copyWith(fontSize: 18);
    b2b = b2!.copyWith(fontWeight: bold);

    b3 = baseStyle.copyWith(fontSize: 16);
    b3b = b3!.copyWith(fontWeight: bold);

    b4 = baseStyle.copyWith(fontSize: 14);
    b4b = b4!.copyWith(fontWeight: bold);

    l1 = baseStyle.copyWith(fontSize: 10);
    l1b = l1!.copyWith(fontWeight: bold);

    l2 = baseStyle.copyWith(fontSize: 8);
    l2b = l2!.copyWith(fontWeight: bold);
  }
}
