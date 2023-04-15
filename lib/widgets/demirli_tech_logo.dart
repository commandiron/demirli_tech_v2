import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key, this.width}) : super(key: key);

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/demirli_tech_text_logo_black.png",
      width: width,
    );
  }
}
