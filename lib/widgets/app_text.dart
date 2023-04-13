import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({Key? key, required this.text, this.fontSize, this.color}) : super(key: key);

  final String text;
  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: fontSize, color: color ?? Colors.white));
  }
}