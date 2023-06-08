import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key, this.width, required this.logoAsset, this.onTap, }) : super(key: key);

  final double? width;
  final String logoAsset;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Image.asset(
        logoAsset,
        width: width,
      ),
    );
  }
}
